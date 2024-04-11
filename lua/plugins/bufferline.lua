return {'akinsho/bufferline.nvim',
  version = "*",
  event = {"BufReadPre", "BufNewFile"},
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup({
    options = {
      always_show_bufferline = false,
      offsets = {
        {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            separator = true -- use a "true" to enable the default, or set your own character
        }
    }
    }
  })
  end
}
