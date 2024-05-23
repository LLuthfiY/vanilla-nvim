return {
	"m4xshen/hardtime.nvim",
	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	enable = false,
	opts = {},
	config = true,
	event = {
		"BufReadPost",
		"BufNewFile",
	},
}
