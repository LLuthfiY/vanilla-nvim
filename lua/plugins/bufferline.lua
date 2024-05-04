return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
    -- get highlight colors
    local getHL = vim.api.nvim_get_hl
    local color = {
      background_fill = getHL(0, {name= "TelescopeNormal"}).bg,
    }
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
      highlights = {
        fill = { bg = color.background_fill },
        background = { bg = color.background_fill },
        tab = { bg = color.background_fill },
        close_button = { bg = color.background_fill },
        diagnostic = { bg = color.background_fill },
        diagnostic_visible = { bg = color.background_fill },
        hint = { bg = color.background_fill },
        hint_diagnostic = { bg = color.background_fill },
        info = { bg = color.background_fill },
        info_diagnostic = { bg = color.background_fill },
        warning = { bg = color.background_fill },
        warning_diagnostic = { bg = color.background_fill },
        error = { bg = color.background_fill },
        error_diagnostic = { bg = color.background_fill },
        modified = { bg = color.background_fill },
        duplicate = { bg = color.background_fill },
        separator = { bg = color.background_fill },
      }
		})
	end,
}
