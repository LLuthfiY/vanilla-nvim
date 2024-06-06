return {
	"xiyaowong/transparent.nvim",
	-- enabled = false,
	lazy = false,
	config = function()
		local transparent = require("transparent")
		transparent.clear_prefix("BufferLine")
		transparent.clear_prefix("NeoTree")
		transparent.clear_prefix("barbecue")
		transparent.clear_prefix("lualine_c")
		transparent.clear_prefix("lualine_x")
		transparent.clear_prefix("Ibl")
		transparent.clear_prefix("@ibl")
		opts = {
			exclude_groups = {
				"NormalFloat",
			},
		}
		transparent.setup(opts)
	end,
}
