--------------------------------------------------------------------------------
-------------------------------- Set Theme -------------------------------------
--------------------------------------------------------------------------------
-- you can install theme in folder /lua/themes (recommended for aesthetic) or --
------------------------------ /lua/plugins ------------------------------------
--------------------------------------------------------------------------------
local theme = "nord"
--------------------------------------------------------------------------------
------------------------------ Set Cmp Style -----------------------------------
--------------------------------------------------------------------------------

local cmpStyle = {
	fields = { "kind", "abbr", "menu" },
	kind = {
		coloredBackground = true,
		tailwindColor = true, -- support for tailwind color in cmp
		stringFormat = "symbol", -- "text" or "symbol", "symbol" by default, can "symbol - text"
	},
	menu = {
		align = "right",
	},
	abbr = {
		leftSpaces = 0,
		rightSpaces = 8,
	},
}

return {
	theme = theme,
	cmpStyle = cmpStyle,
}
