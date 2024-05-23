return {
	"m4xshen/hardtime.nvim",
	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	opts = {},
	config = true,
	event = {
		"BufReadPost",
		"BufNewFile",
	},
}
