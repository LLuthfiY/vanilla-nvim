return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	lazy = false,
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				prompt_prefix = "  ",
				selection_caret = "|> ",
				selection_strategy = "reset",
				entry_prefix = "   ",
				mappings = {
					i = {
						["<c-j>"] = actions.move_selection_next,
						["<c-k>"] = actions.move_selection_previous,
					},
				},
			},
		})
	end,
}
