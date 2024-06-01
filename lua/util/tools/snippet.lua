local M = {}

local global_snippets = require("configs.snippets").global
local snippets_by_filetype = require("configs.snippets").filetype
local friendly_snippets = require("configs.Settings").tools.friendlySnippets

local function get_buf_snips()
	local ft = vim.bo.filetype
	local snips = vim.list_slice(global_snippets)

	if ft and snippets_by_filetype[ft] then
		vim.list_extend(snips, snippets_by_filetype[ft])
	end

	return snips
end

-- cmp source for snippets to show up in completion menu
M.register_sources = function()
	local cmp_source = {}
	local cache = {}
	function cmp_source.complete(_, _, callback)
		local bufnr = vim.api.nvim_get_current_buf()
		if not cache[bufnr] then
			local completion_items = vim.tbl_map(function(s)
				local item = {
					word = s.prefix,
					label = s.prefix,
					kind = vim.lsp.protocol.CompletionItemKind.Snippet,
					insertText = s.body,
					insertTextFormat = vim.lsp.protocol.InsertTextFormat.Snippet,
					detail = s.body,
				}
				return item
			end, get_buf_snips())

			cache[bufnr] = completion_items
		end

		callback(cache[bufnr])
	end

	return cmp_source
end

return M
