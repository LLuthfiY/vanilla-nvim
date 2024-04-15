return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		local palette = require("catppuccin.palettes").get_palette("frappe")
		require("catppuccin").setup({
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
				TelescopeNormal = { bg = palette.surface0 },
				TelescopePreviewBorder = { fg = palette.surface0, bg = palette.surface0 },
				TelescopePreviewNormal = { bg = palette.surface0 },
				TelescopePreviewTitle = { fg = palette.surface0, bg = palette.green },
				TelescopePromptBorder = { fg = palette.surface0, bg = palette.surface0 },
				TelescopePromptNormal = { fg = palette.text, bg = palette.surface0 },
				TelescopePromptPrefix = { fg = palette.red, bg = palette.surface0_alt },
				TelescopePromptTitle = { fg = palette.surface0, bg = palette.red },
				TelescopeResultsBorder = { fg = palette.base, bg = palette.base },
				TelescopeResultsNormal = { bg = palette.base },
				TelescopeResultsTitle = { fg = palette.base, bg = palette.base },
				TelescopeSelection = { fg = palette.text, bg = palette.surface0 },
				TelescopeSelectionCaret = { fg = palette.green, bg = palette.surface0 },
				CmpDocBorder = { fg = palette.surface0, bg = palette.surface0 },
				CmpDocNormal = { bg = palette.surface0 },
			},
		})
	end,
}
