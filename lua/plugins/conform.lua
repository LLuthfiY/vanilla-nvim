return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			lsp_fallback = true,

			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { "prettier" },
        javascript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
				svelte = { "prettier" },
			},
		})
	end,
}
