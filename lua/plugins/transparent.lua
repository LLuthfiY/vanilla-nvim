return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	config = function()
		local transparent = require("transparent")
		transparent.clear_prefix("BufferLine")
		transparent.clear_prefix("NeoTree")
		transparent.clear_prefix("barbecue")
		transparent.clear_prefix("lualine")
		transparent.setup()
	end,
}
