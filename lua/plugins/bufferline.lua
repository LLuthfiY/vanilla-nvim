return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or "")
				s = s .. n .. sym
			end
			return s
		end
		require("bufferline").setup({
			options = {
				always_show_bufferline = false,
				diagnostics = "nvim_lsp",
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true, -- use a "true" to enable the default, or set your own character
					},
				},
			},
		})
	end,
}
