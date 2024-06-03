local settings = require("configs.Settings")
vim.lsp.inlay_hint.enable(settings.tools.inlayHint)
if settings.tools.useSystemClipboard then
	vim.cmd("set clipboard=unnamedplus")
end
