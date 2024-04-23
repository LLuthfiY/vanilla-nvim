return {
	"neanias/everforest-nvim",
	version = false,
	-- lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
	-- Optional; default configuration will be used if setup isn't called.
	config = function()
		require("everforest").setup({
			on_highlights = function(hl, c)
				hl.TelescopeBorder = { fg = c.bg1, bg = c.bg1 }
				hl.TelescopeNormal = { bg = c.bg1 }
				hl.TelescopePreviewBorder = { fg = c.bg1, bg = c.bg1 }
				hl.TelescopePreviewNormal = { bg = c.bg1 }
				hl.TelescopePreviewTitle = { fg = c.bg1, bg = c.green }
				hl.TelescopePromptBorder = { fg = c.bg1, bg = c.bg1 }
				hl.TelescopePromptNormal = { fg = c.fg, bg = c.bg1 }
				hl.TelescopePromptPrefix = { fg = c.red, bg = c.bg1 }
				hl.TelescopePromptTitle = { fg = c.bg1, bg = c.red }
				hl.TelescopeResultsBorder = { fg = c.bg2, bg = c.bg2 }
				hl.TelescopeResultsNormal = { bg = c.bg2 }
				hl.TelescopeResultsTitle = { fg = c.bg2, bg = c.bg2 }
				hl.TelescopeSelection = { fg = c.fg, bg = c.bg1 }
				hl.TelescopeSelectionCaret = { fg = c.green, bg = c.bg1 }
				hl.CmpDocBorder = { fg = c.green, bg = c.bg1 }
				hl.CmpDocNormal = { bg = c.bg1 , fg = c.fg }
        hl.NotifyError = { fg = c.red }
        hl.NotifyErrorBorder = { fg = c.red }
        hl.NotifyWarning = { fg = c.yellow }
        hl.NotifyWARNBorder = { fg = c.yellow}
        hl.NotifyInfo = { fg = c.blue }
        hl.NotifyINFOBorder = { fg = c.blue }
        hl.NotifyHint = { fg = c.green }
        hl.NotifyHINTBorder = { fg = c.green }
			end,
		})
	end,
}
