return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	lazy = false,
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("configs.telescope")
	end,
}
