return {
	"numToStr/Comment.nvim",
	opts = {
		-- add any options here
		opleader = {
			line = "<c-/>",
		},
		toggler = {
			line = "<c-/>",
		},
	},
	event = { "BufReadPre", "BufNewFile" },
}
