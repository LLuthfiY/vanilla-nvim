return {
	"VonHeikemen/fine-cmdline.nvim",
	lazy = false,
	dependencies = {
		{ "MunifTanjim/nui.nvim" },
	},
	config = function()
		local fine = require("fine-cmdline")
		local fn = fine.fn
		fine.setup({
			cmdline = {
				prompt = "|> ",
			},
			popup = {
				win_options = {
					winhighlight = "Normal:TelescopeNormal,FloatBorder:TelescopeBorder",
				},
			},
			-- set close using backspace button if there no characters
		})
	end,
}
