return {
	"nvim-neo-tree/neo-tree.nvim",
	-- lazy = false,
	event = "VeryLazy",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				window = {
					mappings = {
						["h"] = function(state)
							local node = state.tree:get_node()
							if node.type == "directory" and node:is_expanded() then
								require("neo-tree.sources.filesystem").toggle_directory(state, node)
							else
								require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
							end
						end,
						["l"] = function(state)
							local node = state.tree:get_node()
							local path = node:get_id()
							if node.type == "directory" then
								if not node:is_expanded() then
									require("neo-tree.sources.filesystem").toggle_directory(state, node)
								elseif node:has_children() then
									require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
								end
							end
							if node.type == "file" then
								require("neo-tree.utils").open_file(state, path)
							end
						end,
					},
				},
			},
		})
	end,
}
