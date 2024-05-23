require("configs.options")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath })
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require("configs.lazy")

-- load plugins
require("lazy").setup({
	{ import = "plugins" },
	{ import = "plugins.learn_vim" },
	{ import = "themes" },
}, lazy_config)

vim.schedule(function()
	require("configs.mappings")
end)

local configUI = require("configs.UI")
local colorscheme = require("util.ui.colorscheme")

colorscheme.setColorScheme(configUI.theme)
colorscheme.SetHighlight(configUI.theme, configUI.cmpStyle.kind.coloredBackground)
