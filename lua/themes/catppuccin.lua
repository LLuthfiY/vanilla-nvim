return {
	"catppuccin/nvim",
	name = "catppuccin",
	-- lazy = false,
	priority = 1000,
	config = function()
		local flavour = "frappe"
		local palette = require("catppuccin.palettes").get_palette(flavour)
		require("catppuccin").setup({
			flavour = flavour,
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
		})
	end,
}
