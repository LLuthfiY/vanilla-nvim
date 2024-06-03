return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"onsails/lspkind.nvim",
		-- { "garymjr/nvim-snippets", opts = {
		-- 	friendly_snippets = true,
		-- }, config = true },
		"rafamadriz/friendly-snippets",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local cmp = require("cmp")
		local config = require("configs.Settings")
		local completionStyle = require("util.ui.completionStyle")
		local snippet = require("util.tools.snippet")
		cmp.register_source("snp", snippet.register_sources())

		local opts = {
			completion = {
				completeopt = "menu,menuone",
			},

			window = {
				completion = {
					col_offset = -3,
					side_padding = 0,
					-- winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,Search:None",
				},
				documentation = {
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					border = "single",
				},
			},
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},

			formatting = {
				format = function(entry, vim_item)
					if entry.completion_item.detail and not vim_item.menu then
						vim_item.menu = entry.completion_item.detail
					end

					if entry.completion_item.menu then
						vim_item.menu = entry.completion_item.menu
					end
					local width = config.cmpStyle.menu.width
					local align = config.cmpStyle.menu.align or "left"
					vim_item = completionStyle.menu.setAlign(entry, vim_item, align, width)
					vim_item = completionStyle.abbr.setSpaces(
						entry,
						vim_item,
						config.cmpStyle.abbr.leftSpaces,
						config.cmpStyle.abbr.rightSpaces
					)
					if config.cmpStyle.kind.tailwindColor then
						vim_item =
							completionStyle.kind.tailwind(entry, vim_item, config.cmpStyle.kind.coloredBackground)
					end
					vim_item = completionStyle.kind.format(entry, vim_item, config.cmpStyle.kind.stringFormat)
					return vim_item
				end,
				fields = config.cmpStyle.fields,
			},

			mapping = {
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					-- elseif has_words_before() then
					-- 	cmp.complete()
					elseif vim.snippet.active({ direction = 1 }) then
						vim.snippet.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif vim.snippet.active({ direction = -1 }) then
						vim.snippet.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "snp" },
				-- { name = "snippets" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "path" },
			},
		}
		cmp.setup(opts)
	end,
}
