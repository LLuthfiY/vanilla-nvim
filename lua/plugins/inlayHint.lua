return {
	"MysticalDevil/inlay-hints.nvim",
	event = "lspAttach",
	depedencies = { "neovim/nvim-lspconfig" },
	config = function()
		require("inlay-hints").setup()
	end,
}
