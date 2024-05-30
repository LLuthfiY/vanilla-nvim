-- return {
-- 	"Exafunction/codeium.vim",
-- 	-- event="BufEnter",
-- 	event = { "BufReadPre", "BufNewFile" },
-- 	config = function()
-- 		vim.g.codeium_tab_fallback = "\t"
-- 	end,
-- }
return {
	"monkoose/neocodeium",
	event = "VeryLazy",
	config = function()
		local neocodeium = require("neocodeium")
		neocodeium.setup()
	end,
}
