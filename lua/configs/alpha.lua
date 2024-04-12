local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
require("alpha.term")

dashboard.section.terminal.command = "dig reddit.com"
dashboard.section.terminal.height = 10
dashboard.section.terminal.width = 50

local header = {
  type = "terminal",
  command = "viu ~/.config/nvim/static/kalsit_catppuccin.png",
  height = 25,
  width = 202,
  opts = {
    redraw = true,
    position = "center",
  },
}

local find_files = {
  type = "button",
  val = "  Find files",
  on_press = function()
    require("telescope.builtin").find_files()
  end,
  opts = {
    position = "center",
    shortcut = "f          ",
    keymap = { { "n", "t" }, "f", "<cmd>Telescope find_files<cr>" },
  },
}

local new_file = {
  type = "button",
  val = "  New file  ",
  on_press = function()
    vim.cmd("enew")
  end,
  opts = {
    position = "center",
    shortcut = "n          ",
    keymap = { { "n", "t" }, "n", "<cmd>enew<cr>" },
  },
}

local config_nvim = {
  type = "button",
  val = "  Config    ",
  on_press = function()
    require("telescope.builtin").find_files({ cwd = "~/.config/nvim/" })
  end,
  opts = {
    position = "center",
    shortcut = "c          ",
    keymap = { { "n", "t" }, "c", "<cmd>Telescope find_files cwd=~/.config/nvim/<cr>" },
  }
}

local quit = {
  type = "button",
  val = "Q  Quit      ",
  on_press = function()
    vim.cmd("quit")
  end,
  opts = {
    position = "center",
    shortcut = "q          ",
    keymap = { { "n", "t" }, "q", "<cmd>quit<cr>" },
  },
}


-- Send config to alpha
--
dashboard.config.layout = {
  { type = "padding", val = 2 },
  header,
  { type = "padding", val = 6 },
  find_files,
  new_file,
  config_nvim,
  quit,
}
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
