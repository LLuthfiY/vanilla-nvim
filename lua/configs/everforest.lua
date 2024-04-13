local opts = {
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
  end,
}

require("everforest").setup(opts)
