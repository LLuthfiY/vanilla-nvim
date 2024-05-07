--------------------------------------------------------------------------------
-------------------------------- Set Theme -------------------------------------
--------------------------------------------------------------------------------
local theme = "catppuccin"
--------------------------------------------------------------------------------
vim.cmd("colorscheme " .. theme)

local get_hl = vim.api.nvim_get_hl
local set_hl = vim.api.nvim_set_hl

local color = get_hl(0, {})

local setCmpColors = function(hlName)
	if color[hlName] then
		if color[hlName].link then
			set_hl(0, hlName, { bg = color[color[hlName].link].fg, fg = color["NormalFloat"].bg })
		else
			set_hl(0, hlName, { bg = color[hlName].fg, fg = color["NormalFloat"].bg })
		end
	end
end

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

setCmpColors("CmpItemKind")
setCmpColors("CmpItemKindClass")
setCmpColors("CmpItemKindConstant")
setCmpColors("CmpItemKindConstructor")
setCmpColors("CmpItemKindEnum")
setCmpColors("CmpItemKindEnumMember")
setCmpColors("CmpItemKindEvent")
setCmpColors("CmpItemKindField")
setCmpColors("CmpItemKindFile")
setCmpColors("CmpItemKindFolder")
setCmpColors("CmpItemKindFunction")
setCmpColors("CmpItemKindInterface")
setCmpColors("CmpItemKindKeyword")
setCmpColors("CmpItemKindMethod")
setCmpColors("CmpItemKindModule")
setCmpColors("CmpItemKindOperator")
setCmpColors("CmpItemKindProperty")
setCmpColors("CmpItemKindReference")
setCmpColors("CmpItemKindSnippet")
setCmpColors("CmpItemKindStruct")
setCmpColors("CmpItemKindTypeParameter")
setCmpColors("CmpItemKindUnit")
setCmpColors("CmpItemKindValue")
setCmpColors("CmpItemKindVariable")
setCmpColors("CmpItemKindText")

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
