return {
	"nvim-lualine/lualine.nvim",
	-- event = {"bufReadPre", "BufNewFile"},
	lazy = false,
	config = function()
		require("lualine").setup({
			options = {
				sections = {
					lualine_a = {
						file = 1,
					},
				},
			},
		})
	end,
}
