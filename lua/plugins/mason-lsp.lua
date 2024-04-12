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
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
      require("configs.lsp")
		end,
	},
}
