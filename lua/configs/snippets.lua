local snippet = {}
snippet.global = {}
snippet.filetype = {
	lua = {
		{
			prefix = "hw",
			body = [[print('hello ${1:world}')
$0]],
		},
	},
}

return snippet
