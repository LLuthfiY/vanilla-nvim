return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			lsp_fallback = true,

			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { "biome" },
				svelte = { "biome" },
			},
		})
	end,
}
