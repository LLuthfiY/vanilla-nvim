return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		build = ":MasonUpdate",
    config = true,
		-- config = function()
		-- 	require("mason").setup({
		-- 		providers = { "mason.providers.client", "mason.providers.registry-api" },
		-- 	})
		-- end,
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
