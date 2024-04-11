return {
  "nvim-lualine/lualine.nvim",
  event = {"bufReadPre", "BufNewFile"},
  config = function()
    require("configs.lualine")
  end,
}
