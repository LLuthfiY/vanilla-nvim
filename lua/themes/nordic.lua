return {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000,
	config = function()
    local palette = require("nordic.colors")
    local color = {
      bg0 = palette.gray0,
      bg1 = palette.gray1,
      bg2 = palette.gray2,
      bg3 = palette.gray3,
      bg4 = palette.gray4,
      fg = palette.white1,
      accent = palette.blue1,
      error = palette.red.base,
      warning = palette.yellow.base,
      info = palette.blue0,
      hint = palette.green.base,
    }
		require("nordic").setup({
			override = {
				TelescopeBorder = { fg = color.bg1, bg = color.bg1 },
				TelescopeNormal = { bg = color.bg1 },
				TelescopePreviewBorder = { fg = color.bg2, bg = color.bg2 },
				TelescopePreviewNormal = { bg = color.bg2 },
				TelescopePreviewTitle = { fg = color.bg1, bg = color.bright_green },
				TelescopePromptBorder = { fg = color.bg2, bg = color.bg2 },
				TelescopePromptNormal = { fg = color.fg, bg = color.bg2 },
				TelescopePromptPrefix = { fg = color.error, bg = color.bg2 },
				TelescopePromptTitle = { fg = color.bg1, bg = color.error },
				TelescopeResultsBorder = { fg = color.bg1, bg = color.bg1 },
				TelescopeResultsNormal = { bg = color.bg1 },
				TelescopeResultsTitle = { fg = color.bg1, bg = color.info },
				TelescopeSelection = { fg = color.fg, bg = color.bg2 },
				TelescopeSelectionCaret = { fg = color.hint, bg = color.bg2 },
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
      -- telescope = {
      --   style = "flat"
      -- }
		})
	end,
}
