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
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local config = require("configs.theme")
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
					require("luasnip").lsp_expand(args.body)
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
					vim_item = completionStyle.kind[config.cmpStyle.kind](entry, vim_item)
					vim_item = completionStyle.abbr.setSpaces(
						entry,
						vim_item,
						config.cmpStyle.abbr.leftSpaces,
						config.cmpStyle.abbr.rightSpaces
					)
					return vim_item
				end,
				fields = { "kind", "abbr", "menu" },
			},

			mapping = {
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),

				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						-- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
						cmp.select_next_item()
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
					-- this way you will only jump inside the snippet region
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif vim.fn.exists("b:_codeium_completions") ~= 0 then
						local text = vim.fn["codeium#Accept"]()
						-- if string.find(text, "codeium") then
						if text ~= vim.g.codeium_tab_fallback then
							vim.api.nvim_input(text)
						else
							fallback()
						end
					elseif has_words_before() then
						cmp.complete()
					elseif vim.fn["vsnip#available"](1) == 1 then
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif require("luasnip").jumpable(-1) then
						vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
					else
						fallback()
					end
				end, { "i", "s" }),
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "path" },
			},
		}
		cmp.setup(opts)
	end,
}
