local M = {}

local global_snippets = require("configs.snippets").global
local snippets_by_filetype = require("configs.snippets").filetype
local friendly_snippets = require("configs.Settings").tools.friendlySnippets

local function get_friendly_snippets()
	if friendly_snippets then
		local friendlySnippetsPath = vim.fn.stdpath("data") .. "/lazy/friendly-snippets/snippets"
		local friendlySnippetsTable = {}
		for file in io.popen("find " .. friendlySnippetsPath .. [[ -name "*.json"]]):lines() do
			local lang = vim.fn.fnamemodify(file, ":t:r")
			local f = io.open(file, "r")
			if not f then
				return
			end
			local content = f:read("*all")
			io.close(f)
			local snippets = vim.json.decode(content)
			-- snippets_by_filetype[lang] = vim.tbl_deep_extend("force", snippets_by_filetype[lang], snippets)
			friendlySnippetsTable[lang] = snippets
		end

		return friendlySnippetsTable
	else
		return {}
	end
end

local function get_buf_snips()
	local ft = vim.bo.filetype
	local snips = global_snippets or {}
	local fs = get_friendly_snippets() or {}

	if ft and snippets_by_filetype[ft] then
		snips = vim.tbl_deep_extend("force", snips, snippets_by_filetype[ft])
	end

	if fs[ft] then
		snips = vim.tbl_deep_extend("force", snips, fs[ft])
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
			local completion_items = {}
			for key, value in pairs(get_buf_snips()) do
				local body = value.body
				if type(body) == "table" then
					body = table.concat(body, "\n")
				end
				local item = {
					word = value.prefix,
					label = key,
					kind = vim.lsp.protocol.CompletionItemKind.Snippet,
					insertText = body,
					insertTextFormat = vim.lsp.protocol.InsertTextFormat.Snippet,
					detail = body,
				}
				table.insert(completion_items, item)
			end
			cache[bufnr] = completion_items
		end

		callback(cache[bufnr])
	end

	return cmp_source
end

return M
