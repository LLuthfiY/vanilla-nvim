local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    typescript = { "biome" },
    svelte = { "biome"},
  },
}


require("conform").setup(options)
