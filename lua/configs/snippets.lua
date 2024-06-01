local snippet = {}
snippet.global = {}
snippet.filetype = {
	lua = {
		["hello world"] = {
			prefix = "hw",
			body = [[print("hello ${1:world}")]],
		},
	},
}

return snippet
