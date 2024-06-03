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

local ternary = function(condition, trueValue, falseValue)
	if condition then
		return trueValue
	else
		return falseValue
	end
end
local icons = {
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰜢",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "󰈇",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "󰙅",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "",
}

return {
	kind = {
		tailwind = function(entry, vim_item, coloredBackground)
			if vim_item.kind == "Color" and entry.completion_item.documentation then
				local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
				if r then
					local color = string.format("%02x%02x%02x", r, g, b)
					local group = "TailwindColor" .. color
					if vim.fn.hlID(group) < 1 then
						if coloredBackground then
							vim.api.nvim_set_hl(0, group, { bg = "#" .. color, fg = contrast_color(color) })
						else
							vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
						end
					end
					vim_item.kind_hl_group = group
				end
			end

			return vim_item
		end,
		format = function(entry, vim_item, stringFormat)
			local stringFormatCopy = stringFormat or "symbol"
			if stringFormatCopy and vim_item.kind then
				stringFormatCopy = string.gsub(stringFormatCopy, "text", vim_item.kind)
				stringFormatCopy = string.gsub(stringFormatCopy, "symbol", icons[vim_item.kind])
				vim_item.kind = " " .. stringFormatCopy .. " "
			end
			return vim_item
		end,
	},
	menu = {
		setAlign = function(entry, vim_item, align, width)
			if vim_item.menu ~= nil then
				width = width or (ternary(align == "right", 30, 9999))
				print(width)
				if string.len(vim_item.menu) > width then
					local leftCharacters = math.floor(width / 2)
					local rightCharacters = (width - leftCharacters - 3)
					vim_item.menu = string.sub(vim_item.menu, 1, leftCharacters)
						.. "..."
						.. string.sub(vim_item.menu, -rightCharacters)
				end
				if align == "left" then
					width = width * -1
				end
				if width ~= -9999 then
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
