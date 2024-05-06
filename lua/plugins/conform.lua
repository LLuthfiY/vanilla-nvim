return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			lsp_fallback = true,

			formatters_by_ft = {
				lua = { "stylua" },
				typescript = { "biome" },
				javascript = { "biome" },
				html = { "prettierd" },
				css = { "prettierd" },
				svelte = { "prettierd" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
