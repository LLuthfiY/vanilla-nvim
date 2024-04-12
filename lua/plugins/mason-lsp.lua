return {
	{
		"williamboman/mason.nvim",
    cmd = {"Mason", "MasonInstall", "MasonUpdate", "MasonUninstall", "MasonUninstallAll", "MasonLog", "MasonInstallAll"},
		lazy = false,
		build = ":MasonUpdate",
		config = function()
      require("configs.mason")
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
      require("configs.lsp")
		end,
	},
}
