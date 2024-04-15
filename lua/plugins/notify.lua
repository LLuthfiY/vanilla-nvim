return {
	"rcarriga/nvim-notify",
	lazy = false,
	config = function()
		local notify = require("notify")

		notify.setup({
			render = "minimal",
			stages = "fade_in_slide_out",
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		})
		vim.notify = notify
	end,
}
