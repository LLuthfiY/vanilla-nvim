local settings = require("configs.Settings")
local colorscheme = require("util.ui.colorscheme")

colorscheme.setColorScheme(settings.UI.theme)
colorscheme.SetHighlight(settings.theme, settings.UI.cmpStyle.kind.coloredBackground)
