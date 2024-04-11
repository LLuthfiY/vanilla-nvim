local palette = require("catppuccin.palettes").get_palette("frappe")
local opts = {
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = {
			enabled = true,
			show_root = true,
			transparent_panel = true,
		},
		telescope = true,
		treesitter = true,
	},
	custom_highlights = {
		TelescopeBorder = { fg = palette.surface0, bg = palette.surface0 },
		TelescopeNormal = { bg = palette.surface0},
		TelescopePreviewBorder = { fg = palette.surface0, bg = palette.surface0 },
		TelescopePreviewNormal = { bg = palette.surface0 },
		TelescopePreviewTitle = { fg = palette.surface0, bg = palette.green },
		TelescopePromptBorder = { fg = palette.surface0, bg = palette.surface0 },
		TelescopePromptNormal = { fg = palette.text, bg = palette.surface0 },
		TelescopePromptPrefix = { fg = palette.red, bg = palette.surface0_alt },
		TelescopePromptTitle = { fg = palette.surface0, bg = palette.red },
		TelescopeResultsBorder = { fg = palette.base, bg = palette.base },
		TelescopeResultsNormal = { bg = palette.base },
		TelescopeResultsTitle = { fg = palette.surface0, bg = palette.surface0 },
	},
}

require("catppuccin").setup(opts)

vim.cmd([[colorscheme catppuccin-frappe]])
