return {
  "stevearc/conform.nvim",
  event = "BufEnter",
  config = function()
    require "configs.conform"
  end
}
