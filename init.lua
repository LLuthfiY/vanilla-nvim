require("configs.pre-config")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
local plugins = {
	{ import = "plugins" },
	{ import = "themes" },
}

require("lazy").setup(plugins, lazy_config)

vim.schedule(function()
	require("configs.mappings")
end)

local req = require("util.tools.requireAll")
local settings = require("configs.Settings")
vim.cmd("colorscheme " .. settings.theme) -- prevent colorscheme flickering while loading
vim.schedule(function()
	req.all("lua/auto-commands/*.lua")
end)
