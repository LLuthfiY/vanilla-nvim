return { "ellisonleao/gruvbox.nvim", priority = 1000 , config = function ()
  local palette = require("gruvbox").palette
  require("gruvbox").setup({
    overrides = {
      TelescopeBorder = { fg = palette.dark1, bg = palette.dark1 },
      TelescopeNormal = { bg = palette.dark1 },
      TelescopePreviewBorder = { fg = palette.dark2, bg = palette.dark2 },
      TelescopePreviewNormal = { bg = palette.dark2 },
      TelescopePreviewTitle = { fg = palette.dark1, bg = palette.bright_green },
      TelescopePromptBorder = { fg = palette.dark2, bg = palette.dark2 },
      TelescopePromptNormal = { fg = palette.text, bg = palette.dark2 },
      TelescopePromptPrefix = { fg = palette.neutral_green, bg = palette.dark2 },
      TelescopePromptTitle = { fg = palette.dark1, bg = palette.bright_red },
      TelescopeResultsBorder = { fg = palette.dark1, bg = palette.dark1 },
      TelescopeResultsNormal = { bg = palette.dark1 },
      TelescopeResultsTitle = { fg = palette.dark1, bg = palette.bright_blue },
      TelescopeSelection = { fg = palette.fg, bg = palette.dark2 },
      TelescopeSelectionCaret = { fg = palette.bright_green,  },
      CmpDocBorder = { fg = palette.dark2, bg = palette.dark2 },
      CmpDocNormal = { bg = palette.dark2 },
    }
  })
end}
