return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {
		indent = {
			-- char = "▏",
			char = " ",
		},
		scope = {
			char = "▏",
		},
	},
	config = true,
	event = { "BufReadPost", "BufNewFile" },
}
