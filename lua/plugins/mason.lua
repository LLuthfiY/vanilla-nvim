return 	{
		"williamboman/mason.nvim",
		cmd = {
			"Mason",
			"MasonInstall",
			"MasonUpdate",
			"MasonUninstall",
			"MasonUninstallAll",
			"MasonLog",
			"MasonInstallAll",
		},
		lazy = false,
		build = ":MasonUpdate",
		config = function()
			local mason = require("mason")
			local opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
				ensure_installed = {
					"lua-language-server",
					"typescript-language-server",
					"biome",
					"svelte-language-server",
					"stylua",
					"pyright",
					"eslint-lsp",
					"rust-analyzer",
					"emmet-ls",
				},
			}

			mason.setup(opts)

			vim.api.nvim_create_user_command("MasonInstallAll", function()
				if opts.ensure_installed and #opts.ensure_installed > 0 then
					vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
				end
			end, {})
		end,
	}
