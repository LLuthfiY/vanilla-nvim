local M = {}
--------------------------------------------------------------------------------
-------------------------------- Set Theme -------------------------------------
--------------------------------------------------------------------------------
-- you can install theme in folder /lua/themes (recommended for aesthetic) or --
------------------------------ /lua/plugins ------------------------------------
--------------------------------------------------------------------------------
M.theme = "nord"
--------------------------------------------------------------------------------
------------------------------ Set Cmp Style -----------------------------------
--------------------------------------------------------------------------------

M.cmpStyle = {
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

M.tools = {
	practice = true, -- if true, enable practice mode (hardtime.lua)
	inlayHint = true,
	friendlySnippets = true,
}

return M
