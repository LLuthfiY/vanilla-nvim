local opts = {
	options = {
		theme = "catppuccin-frappe",
		sections = {
			lualine_a = {
				file = 1,
			},
		},
	},
}

require("lualine").setup(opts)
