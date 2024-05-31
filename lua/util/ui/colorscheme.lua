return {
	SetHighlight = function(theme, coloredBackground)
		coloredBackground = coloredBackground or false

		theme = theme or "catppuccin"

		local get_hl = vim.api.nvim_get_hl
		local set_hl = vim.api.nvim_set_hl

		local color = get_hl(0, {})

		local function get_hl_link(hlName)
			if color[hlName] then
				if color[hlName].link then
					return get_hl_link(color[hlName].link)
				else
					return color[hlName]
				end
			else
				return color["CmpItemKind"] or color["CmpItemKindDefault"]
			end
		end

		local setCmpcolor = function(hlName)
			if color[hlName] then
				if color[hlName].link then
					local link = get_hl_link(color[hlName].link)
					if link.fg then
						set_hl(0, hlName, { bg = link.fg, fg = color["NormalFloat"].bg, bold = true })
					else
						set_hl(0, hlName, { bg = color["NormalFloat"].fg, fg = color["NormalFloat"].bg, bold = true })
					end
				else
					if color[hlName].fg then
						set_hl(0, hlName, { bg = color[hlName].fg, fg = color["NormalFloat"].bg, bold = true })
					end
				end
			end
		end

		local kinds = {
			"",
			"Text",
			"Method",
			"Function",
			"Constructor",
			"Field",
			"Variable",
			"Class",
			"Interface",
			"Module",
			"Property",
			"Unit",
			"Value",
			"Enum",
			"Keyword",
			"Snippet",
			"Color",
			"File",
			"Reference",
			"Folder",
			"EnumMember",
			"Constant",
			"Struct",
			"Event",
			"Operator",
			"TypeParameter",
		}

		--------------------------------------------------------------------------------
		------------------------------- Set highlights ---------------------------------
		--------------------------------------------------------------------------------

		-- Telescope
		set_hl(0, "TelescopeNormal", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].fg })
		set_hl(0, "TelescopeBorder", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].bg })
		set_hl(0, "TelescopePromptBorder", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].bg })
		set_hl(0, "TelescopePromptNormal", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].fg })
		set_hl(0, "TelescopePromptPrefix", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].fg })
		set_hl(0, "TelescopeResultsBorder", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].bg })
		set_hl(0, "TelescopePreviewBorder", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].bg })
		set_hl(0, "TelescopeResultsNormal", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].fg })
		set_hl(0, "TelescopePreviewNormal", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].fg })

		-- Cmp
		set_hl(0, "CmpDocBorder", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].bg })
		set_hl(0, "CmpDocNormal", { bg = color["NormalFloat"].bg })

		if coloredBackground then
			for _, v in ipairs(kinds) do
				setCmpcolor("CmpItemKind" .. v)
			end
		end

		-- Notify
		set_hl(0, "NotifyError", { fg = color["DiagnosticError"].fg })
		set_hl(0, "NotifyERRORBorder", { fg = color["DiagnosticError"].fg })
		set_hl(0, "NotifyWarning", { fg = color["DiagnosticWarn"].fg })
		set_hl(0, "NotifyWARNBorder", { fg = color["DiagnosticWarn"].fg })
		set_hl(0, "NotifyInfo", { fg = color["DiagnosticInfo"].fg })
		set_hl(0, "NotifyINFOBorder", { fg = color["DiagnosticInfo"].fg })
		set_hl(0, "NotifyHint", { fg = color["DiagnosticHint"].fg })
		set_hl(0, "NotifyHINTBorder", { fg = color["DiagnosticHint"].fg })

		-- ToggleTerm
		set_hl(0, "ToggleTermBorder", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].bg })

		--------------------------------------------------------------------------------
		--------------------------- Set custom highlights ------------------------------
		--------------------------------------------------------------------------------

		if theme == "nord" then
			set_hl(0, "TelescopePromptBorder", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].bg })
			set_hl(0, "TelescopePromptNormal", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].fg })
			set_hl(0, "TelescopePromptPrefix", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].fg })
			set_hl(0, "TelescopeResultsBorder", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].bg })
			set_hl(0, "TelescopePreviewBorder", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].bg })
			set_hl(0, "LspInlayHint", { fg = color["Comment"].fg })
			-- set_hl(0, "CmpNormal", { bg = color["Comment"].fg, fg = color["Comment"].fg })
		end

		if theme == "gruvbox" then
			set_hl(0, "TelescopePreviewBorder", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].bg })
			set_hl(0, "TelescopePromptBorder", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].bg })
			set_hl(0, "TelescopeResultsBorder", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].bg })
		end

		if theme == "kanagawa" then
			set_hl(0, "NoiceCmdLineIcon", { bg = color["NormalFloat"].bg })
		end
	end,
	setColorScheme = function(theme)
		vim.cmd("colorscheme " .. theme)
	end,
}
