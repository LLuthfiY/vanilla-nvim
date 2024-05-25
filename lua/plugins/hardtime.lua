local settings = require("configs.Settings")
return {
	"m4xshen/hardtime.nvim",
	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	enabled = settings.practice,
	opts = {},
	config = true,
	event = {
		"BufReadPost",
		"BufNewFile",
	},
}
