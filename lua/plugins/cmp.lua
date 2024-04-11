return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"onsails/lspkind.nvim",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
  event = "InsertEnter",
	config = function()
    require("configs.cmp")
	end,
}
