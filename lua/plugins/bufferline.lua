return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
    require("configs.bufferline")
	end,
}
