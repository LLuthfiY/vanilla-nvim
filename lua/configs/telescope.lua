local telescope = require("telescope")
local opts = {
  defaults = {
    prompt_prefix = "  ",
    selection_caret = "|> ",
    selection_strategy = "reset",
    entry_prefix = "   ",
  }
}

telescope.setup(opts)
