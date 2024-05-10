local contrast_color = function(hexColor)
	-- hex to rgb
	hexColor = string.gsub(hexColor, "#", "")
	local r, g, b =
		tonumber("0x" .. hexColor:sub(1, 2)), tonumber("0x" .. hexColor:sub(3, 4)), tonumber("0x" .. hexColor:sub(5, 6))
	if (r * 0.299 + g * 0.587 + b * 0.114) > 186 then
		return vim.api.nvim_get_hl(0, { name = "NormalFloat" }).bg
	else
		return vim.api.nvim_get_hl(0, { name = "NormalFloat" }).fg
	end
end

local icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local get_hl = vim.api.nvim_get_hl
local set_hl = vim.api.nvim_set_hl

local colorHl = get_hl(0, {})

local function get_hl_link(hlName)
	if colorHl[hlName] then
		if colorHl[hlName].link then
			return get_hl_link(colorHl[hlName].link)
		else
			return colorHl[hlName]
		end
	else
		return colorHl["CmpItemKind"] or colorHl["CmpItemKindDefault"]
	end
end

local setCmpcolor = function(hlName)
	if colorHl[hlName] then
		if colorHl[hlName].link then
			local link = get_hl_link(colorHl[hlName].link)
			set_hl(0, hlName, { bg = link.fg, fg = colorHl["NormalFloat"].bg, bold = true })
		else
			if colorHl[hlName].fg then
				set_hl(0, hlName, { bg = colorHl[hlName].fg, fg = colorHl["NormalFloat"].bg, bold = true })
			end
		end
	end
end

return {
	kind = {
		iconBackground = function(entry, vim_item)
			if vim_item.kind == "Color" and entry.completion_item.documentation then
				local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
				if r then
					local color = string.format("%02x%02x%02x", r, g, b)
					local group = "TailwindColor" .. color
					if vim.fn.hlID(group) < 1 then
						vim.api.nvim_set_hl(0, group, { bg = "#" .. color, fg = contrast_color(color) })
					end
					vim_item.kind_hl_group = group
				end
			else
				setCmpcolor("CmpItemKind" .. vim_item.kind)
			end
			vim_item.kind = " " .. icons[vim_item.kind] .. " "
			return vim_item
		end,
		icon = function(entry, vim_item)
			if vim_item.kind == "Color" and entry.completion_item.documentation then
				local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
				if r then
					local color = string.format("%02x%02x%02x", r, g, b)
					local group = "TailwindColor" .. color
					if vim.fn.hlID(group) < 1 then
						vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
					end
					vim_item.kind_hl_group = group
				end
				vim_item.kind = "  "
			else
				-- setCmpcolor("CmpItemKind" .. vim_item.kind)
				vim_item.kind = " " .. icons[vim_item.kind] .. " "
			end

			return vim_item
		end,
	},
	menu = {
		setAlign = function(entry, vim_item, align, width)
			if vim_item.menu ~= nil then
				local isWidthSetted = align == "right" or width or false
				if isWidthSetted then
					width = width or 30
				end
				if string.len(vim_item.menu) > width then
					local leftCharacters = math.floor(width / 2)
					local rightCharacters = (width - leftCharacters - 3)
					vim_item.menu = string.sub(vim_item.menu, 1, leftCharacters)
						.. "..."
						.. string.sub(vim_item.menu, -rightCharacters)
				end
				if isWidthSetted then
					if align == "left" then
						width = width * -1
					end
					vim_item.menu = string.format("%" .. width .. "s", vim_item.menu)
				end
			end
			return vim_item
		end,
	},
	abbr = {
		setSpaces = function(entry, vim_item, leftSpaces, rightSpaces)
			leftSpaces = leftSpaces or 0
			rightSpaces = rightSpaces or 0
			vim_item.abbr =
				string.format("%s%s%s", string.rep(" ", leftSpaces), vim_item.abbr, string.rep(" ", rightSpaces))
			return vim_item
		end,
	},
}
