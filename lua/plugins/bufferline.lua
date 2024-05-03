return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
    -- get highlight colors
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				style_preset = bufferline.style_preset.minimal,
				indicator = { style = "icon", icon = "▎" },
				always_show_bufferline = false,
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local s = " "
					for e, n in pairs(diagnostics_dict) do
						local sym = e == "error" and " " or (e == "warning" and " " or "")
						s = s .. n .. sym
					end
					return s
				end,
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
