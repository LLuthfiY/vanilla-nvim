return {
	"catppuccin/nvim",
	name = "catppuccin",
	-- lazy = false,
	priority = 1000,
	config = function()
		local flavour = "frappe"
		local palette = require("catppuccin.palettes").get_palette(flavour)
		local color = {
			bg0 = palette.surface0,
			bg1 = palette.surface1,
			bg2 = palette.surface2,
			bg3 = palette.surface3,
			bg4 = palette.surface4,
			fg = palette.text,
			accent = palette.maroon,
			error = palette.red,
			warning = palette.yellow,
			info = palette.blue,
			hint = palette.green,
		}
		require("catppuccin").setup({
			flavour = flavour,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = {
					enabled = true,
					show_root = true,
					transparent_panel = true,
				},
				telescope = true,
				treesitter = true,
			},
			custom_highlights = {
				TelescopeBorder = { fg = color.bg0, bg = color.bg0 },
				TelescopeNormal = { bg = color.bg0 },
				TelescopePreviewBorder = { fg = color.bg1, bg = color.bg1 },
				TelescopePreviewNormal = { bg = color.bg1 },
				TelescopePreviewTitle = { fg = color.bg0, bg = color.hint },
				TelescopePromptBorder = { fg = color.bg1, bg = color.bg1 },
				TelescopePromptNormal = { fg = color.fg, bg = color.bg1 },
				TelescopePromptPrefix = { fg = color.hint, bg = color.bg1 },
				TelescopePromptTitle = { fg = color.bg0, bg = color.info },
				TelescopeResultsBorder = { fg = color.bg0, bg = color.bg0 },
				TelescopeResultsNormal = { bg = color.bg0 },
				TelescopeResultsTitle = { fg = color.bg0, bg = color.warning },
				TelescopeSelection = { fg = color.fg, bg = color.bg1 },
				TelescopeSelectionCaret = { fg = color.hint, bg = color.bg1 },
				CmpDocBorder = { fg = color.warning, bg = color.bg1 },
				CmpDocNormal = { bg = color.bg1 },
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
