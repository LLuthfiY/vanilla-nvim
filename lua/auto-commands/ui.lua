local settings = require("configs.Settings")
local colorscheme = require("util.ui.colorscheme")

colorscheme.setColorScheme(settings.theme)
colorscheme.SetHighlight(settings.theme, settings.cmpStyle.kind.coloredBackground)
