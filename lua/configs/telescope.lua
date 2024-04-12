local telescope = require("telescope")
local actions = require("telescope.actions")
local opts = {
  defaults = {
    prompt_prefix = "  ",
    selection_caret = "|> ",
    selection_strategy = "reset",
    entry_prefix = "   ",
    mappings = {
      i = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
      }
    }
  },
}

telescope.setup(opts)
