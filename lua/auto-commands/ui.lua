local ternary = require("util.tools.ternary")
local settings = require("configs.Settings")
local colorscheme = require("util.ui.colorscheme")

vim.cmd("Transparent" .. ternary(settings.UI.transparent, "Enable", "Disable"))

colorscheme.setColorScheme(settings.UI.theme)
colorscheme.SetHighlight(settings.theme, settings.UI.cmpStyle.kind.coloredBackground)
