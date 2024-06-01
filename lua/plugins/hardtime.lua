local settings = require("configs.Settings")
return {
	"m4xshen/hardtime.nvim",
	enabled = settings.practice,
	dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
	opts = {},
	config = true,
	-- lazy = false,
	event = "VeryLazy",
}
