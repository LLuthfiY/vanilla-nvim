return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		{
			"garymjr/nvim-snippets",
			keys = {
				{
					"<Tab>",
					function()
						if vim.snippet.active({ direction = 1 }) then
							vim.schedule(function()
								vim.snippet.jump(1)
							end)
							return
						end
						return "<Tab>"
					end,
					expr = true,
					silent = true,
					mode = "i",
				},
				{
					"<Tab>",
					function()
						vim.schedule(function()
							vim.snippet.jump(1)
						end)
					end,
					expr = true,
					silent = true,
					mode = "s",
				},
				{
					"<S-Tab>",
					function()
						if vim.snippet.active({ direction = -1 }) then
							vim.schedule(function()
								vim.snippet.jump(-1)
							end)
							return
						end
						return "<S-Tab>"
					end,
					expr = true,
					silent = true,
					mode = { "i", "s" },
				},
			},
			opts = {
				friendly_snippets = true,
			},
		},
		"onsails/lspkind.nvim",
		"rafamadriz/friendly-snippets",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local cmp = require("cmp")
		local config = require("configs.Settings")
		local completionStyle = require("util.ui.completionStyle")

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

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
					if entry.completion_item.detail then
						vim_item.menu = entry.completion_item.detail
					end

					local width = config.cmpStyle.menu.width or 30
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
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, { "i", "s" }),
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "snippets" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "path" },
			},
		}
		cmp.setup(opts)
	end,
}
