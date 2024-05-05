--------------------------------------------------------------------------------
-------------------------------- Set Theme -------------------------------------
--------------------------------------------------------------------------------
local theme = "nordic"
--------------------------------------------------------------------------------
vim.cmd("colorscheme " .. theme)

local get_hl = vim.api.nvim_get_hl
local set_hl = vim.api.nvim_set_hl

local color = get_hl(0, {})

-- Telescope
set_hl(0, "TelescopeNormal", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].fg })
set_hl(0, "TelescopeBorder", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].bg })

-- Cmp
set_hl(0, "CmpDocBorder", { bg = color["NormalFloat"].bg, fg = color["NormalFloat"].bg })
set_hl(0, "CmpDocNormal", { bg = color["NormalFloat"].bg })

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

--custom
if theme == "nordic" then
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
