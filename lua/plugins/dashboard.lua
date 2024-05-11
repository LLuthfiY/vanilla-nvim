return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "doom",
			-- preview = {
			-- 	command = "viu ",
			-- 	file_path = "~/.config/nvim/static/kaltsit_catppuccin.png",
			-- 	file_height = 18,
			-- 	file_width = 150,
			-- },

			config = {
				header = {
					"",
					"",
					"",
					"   ／l、   ",
					"",
					"（ﾟ､ ｡ ７    ",
					"",
					"   l  ~ヽ   ",
					"",
					"   じしf_,)ノ",
					"",
					"",
					"",
				},
				center = {
					{
						desc = "Find Files",
						action = "Telescope find_files",
						key = "f",
						icon = "  ",
					},
					{
						desc = "Load Session",
						action = [[lua require("persistence").load()]],
						key = "l",
						icon = "  ",
					},
					{
						desc = "New File",
						action = "enew",
						key = "n",
						icon = "  ",
					},
					{
						desc = "Open Recent File",
						action = "Telescope oldfiles",
						key = "r",
						icon = "  ",
					},
					{
						desc = "Find Text",
						action = "Telescope live_grep",
						key = "s",
						icon = "  ",
					},
					{
						desc = "Update Plugins",
						action = "Lazy update",
						key = "u",
						icon = "  ",
					},
					{
						desc = "Config",
						action = "Telescope find_files cwd=~/.config/nvim/",
						key = "c",
						icon = "  ",
					},
					{
						desc = "Quit",
						action = "quit",
						key = "q",
						icon = "  ",
					},
				},
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
