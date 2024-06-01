return {
	"neovim/nvim-lspconfig",
	-- event = { "BufReadPre", "BufNewFile" },
	event = "VeryLazy",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		capabilities.textDocument.completion.completionItem = {
			documentationFormat = { "markdown", "plaintext" },
			snippetSupport = true,
			preselectSupport = true,
			insertReplaceSupport = true,
			labelDetailsSupport = true,
			deprecatedSupport = true,
			commitCharactersSupport = true,
			tagSupport = { valueSet = { 1 } },
			resolveSupport = {
				properties = {
					"documentation",
					"detail",
					"additionalTextEdits",
				},
			},
		}

		local inlay_hints_settings = {
			includeInlayEnumMemberValueHints = true,
			includeInlayFunctionLikeReturnTypeHints = true,
			includeInlayFunctionParameterTypeHints = true,
			includeInlayParameterNameHints = "literals",
			includeInlayParameterNameHintsWhenArgumentMatchesName = false,
			includeInlayPropertyDeclarationTypeHints = true,
			includeInlayVariableTypeHints = false,
			includeInlayVariableTypeHintsWhenTypeMatchesName = false,
		}

		local lspconfig = require("lspconfig")
		require("mason-lspconfig").setup_handlers({
			function(server)
				lspconfig[server].setup({
					capabilities = capabilities,
				})
			end,
			["tsserver"] = function()
				lspconfig.tsserver.setup({
					settings = {
						completions = { completeFunctionCalls = true },
						typescript = { inlayHints = inlay_hints_settings },
						javascript = { inlayHints = inlay_hints_settings },
					},
					capabilities = capabilities,
				})
			end,
		})

		vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
		-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
	end,
}
