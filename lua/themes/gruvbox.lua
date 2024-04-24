return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		local palette = require("gruvbox").palette
    local color = {
      bg0 = palette.dark0,
      bg1 = palette.dark1,
      bg2 = palette.dark2,
      bg3 = palette.dark3,
      bg4 = palette.dark4,
      fg = palette.light0,
      accent = palette.bright_yellow,
      error = palette.bright_red,
      warning = palette.bright_yellow,
      info = palette.bright_blue,
      hint = palette.bright_green,
    }
		require("gruvbox").setup({
			overrides = {
				TelescopeBorder = { fg = color.bg1, bg = color.bg1 },
				TelescopeNormal = { bg = color.bg1 },
				TelescopePreviewBorder = { fg = color.bg2, bg = color.bg2 },
				TelescopePreviewNormal = { bg = color.bg2 },
				TelescopePreviewTitle = { fg = color.bg1, bg = color.hint },
				TelescopePromptBorder = { fg = color.bg2, bg = color.bg2 },
				TelescopePromptNormal = { fg = color.fg, bg = color.bg2 },
				TelescopePromptPrefix = { fg = color.hint, bg = color.bg2 },
				TelescopePromptTitle = { fg = color.bg1, bg = color.info },
				TelescopeResultsBorder = { fg = color.bg1, bg = color.bg1 },
				TelescopeResultsNormal = { bg = color.bg1 },
				TelescopeResultsTitle = { fg = color.bg1, bg = color.warning },
				TelescopeSelection = { fg = color.fg, bg = color.bg2 },
				TelescopeSelectionCaret = { fg = color.accent, bg = color.bg2 },
				CmpDocBorder = { fg = color.warning, bg = color.bg2 },
				CmpDocNormal = { bg = color.bg2 },
        NotifyError = { fg = color.error },
        NotifyERRORBorder = { fg = color.error },
        NotifyWarning = { fg = color.warning },
        NotifyWARNBorder = { fg = color.warning },
        NotifyInfo = { fg = color.info },
        NotifyINFOBorder = { fg = color.info },
        NotifyHint = { fg = color.hint },
        NotifyHINTBorder = { fg = color.hint },
			},
		})
	end,
}
