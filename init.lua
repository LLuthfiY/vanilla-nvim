require "options"
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)


vim.schedule(function()
  require "mappings"
end)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  { import = "plugins" },
}, lazy_config)
