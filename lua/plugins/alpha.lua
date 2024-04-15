return {
	"goolord/alpha-nvim",
  lazy = false,
  enabled = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
    require("configs.alpha")
	end,
}
