return {
	"folke/noice.nvim",
	-- lazy = false,
	event = "VeryLazy",
	opts = {
		cmdline_popup = {
			border = {
				style = "none",
				padding = { 1, 2 },
			},
			filter_options = {},
			win_options = {
				winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
			},
		},
		mini = {
			border = {
				style = "none",
				padding = { 0, 2 },
			},
			filter_options = {},
		},
		lsp = {
			progress = {
				enabled = false,
			},
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
}
