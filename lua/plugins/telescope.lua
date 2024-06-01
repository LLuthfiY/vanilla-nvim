return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	-- lazy = false,
	event = "VeryLazy",
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				prompt_prefix = "  ",
				selection_caret = "|> ",
				selection_strategy = "reset",
				entry_prefix = "   ",
				mappings = {
					i = {
						["<c-j>"] = actions.move_selection_next,
						["<c-k>"] = actions.move_selection_previous,
						["<esc>"] = actions.close,
						["qq"] = actions.close,
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})
		telescope.load_extension("fzf")
	end,
}
