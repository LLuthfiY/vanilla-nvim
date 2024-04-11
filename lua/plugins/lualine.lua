return {
  "nvim-lualine/lualine.nvim",
  event = {"bufReadPre", "BufNewFile"},
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin-mocha",
        sections = {
          lualine_a = {
            file = 1,
          },
        },
      },
    })
  end,
}
