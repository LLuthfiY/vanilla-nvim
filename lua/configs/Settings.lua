local M = {}
--------------------------------------------------------------------------------
-------------------------------- Set Theme -------------------------------------
--------------------------------------------------------------------------------
-- you can install theme in folder /lua/themes (recommended for aesthetic) or --
------------------------------ /lua/plugins ------------------------------------
--------------------------------------------------------------------------------

M.UI = {
	theme = "poimandres",
	transparent = true,
	cmpStyle = {
		fields = { "kind", "abbr", "menu" },
		kind = {
			coloredBackground = true,
			tailwindColor = true, -- support for tailwind color in cmp
			stringFormat = "symbol", -- "text" or "symbol", "symbol" by default, can "symbol - text"
		},
		menu = {
			align = "right",
			width = 30,
		},
		abbr = {
			leftSpaces = 0,
			rightSpaces = 8,
		},
	},
}

M.tools = {
	practice = false, -- if true, enable practice mode (hardtime.lua)
	inlayHint = true,
	useSystemClipboard = true,
	snippet = {
		friendlySnippets = true,
		extendFileType = {
			-- for friendly Snippets, if no snippet from friendly snippets showed up,
			-- you can extend it manually by adding the friendly snippet FILENAME WITHOUT EXTENSION to this table
			-- you can check friendly snippets filename here: https://github.com/rafamadriz/friendly-snippets/tree/main/snippets
			-- you can check current filetype with :lua print(vim.bo.filetype)
			--
			-- format : <filetype> = { <snippets.lua filetype> or <friendly snippets filename without extension> }
			typescript = { "javascript" },
			typescriptreact = { "typescript", "react" },
			javascriptreact = { "javascript", "react" },
			svelte = { "html", "css", "javascript", "typescript" },
		},
	},
}

return M
