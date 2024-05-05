return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
    -- get highlight colors
    local getHL = vim.api.nvim_get_hl
    local color = {
      background = getHL(0, {name= "NormalFloat"}).bg,
    }
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				style_preset = bufferline.style_preset.minimal,
				indicator = { style = "none", icon = "▎" },
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
      highlights = {
        fill = { bg = color.background },
        background = { bg = color.background },
        tab = { bg = color.background },
        close_button = { bg = color.background },
        diagnostic = { bg = color.background },
        diagnostic_visible = { bg = color.background },
        hint = { bg = color.background },
        hint_diagnostic = { bg = color.background },
        info = { bg = color.background },
        info_diagnostic = { bg = color.background },
        warning = { bg = color.background },
        warning_diagnostic = { bg = color.background },
        error = { bg = color.background },
        error_diagnostic = { bg = color.background },
        modified = { bg = color.background },
        duplicate = { bg = color.background },
        separator = { bg = color.background },
      }
		})
	end,
}
