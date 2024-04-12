return {
  "nvim-lualine/lualine.nvim",
  -- event = {"bufReadPre", "BufNewFile"},
  lazy = false,
  config = function()
    require("configs.lualine")
  end,
}
