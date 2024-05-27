return {
	all = function(dirPath)
		local files = vim.api.nvim_get_runtime_file(dirPath, true)
		for _, file in ipairs(files) do
			local requirepath = string.gsub(file, ".*lua/", "")
			requirepath = string.gsub(requirepath, ".lua", "")
			require(requirepath)
		end
	end,
}
