-- map("v", "<c-/>", function ()
-- Important remove the default mappings from terminal emulator like kiity, because some keymap need that, like c-s-f --
------------------------------------------------------------------------------------------------------------------------

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "float",
	float_opts = {
		border = "single",
	},
})

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map({ "n", "i", "v" }, "qq", "<ESC>", { desc = "Escape insert mode" })

--save
map({ "n", "i", "v" }, "<c-s>", "<cmd>w<cr>", { desc = "Save file" })

-- move and copy line
map({ "n", "i" }, "<A-j>", "<cmd>move .+1<CR>", { desc = "Move Line Down" })
map({ "n", "i" }, "<A-k>", "<cmd>move .-2<CR>", { desc = "Move Line Up" })
map({ "n", "i" }, "<C-A-j>", "<cmd>copy +0<CR>", { desc = "Dup Line Down" })
map({ "n", "i" }, "<C-A-k>", "<cmd>copy -1<CR>", { desc = "Dup Line Up" })

--undo and redo
map({ "n", "i", "v" }, "<C-z>", "<cmd>undo<CR>", { desc = "Undo" })
map({ "n", "i", "v" }, "<C-S-z>", "<cmd>redo<CR>", { desc = "Redo" })

-- cursor
map({ "n", "i" }, "<C-a>", "<ESC>ggVG", { desc = "Select All" })
map({ "n", "i" }, "<C-d>", "<ESC>viws", { desc = "Delete Word" })

-- buffer
map({ "n", "i" }, "qw", function()
	require("bufdelete").bufdelete(0, true)
end, { desc = "Close Buffer" })

-- quit
map({ "n", "i" }, "<c-q>", "<cmd>q<cr>", { desc = "Quit" })

--terminal
--map({ "n", "i" }, "<c-`>", function() require("nvchad.term").toggle({ pos = "sp", id ='basic' }) end, { desc = "Terminal (root dir)" })

--map({ "n", "i" }, "<c-`>", "<cmd>ToggleTerm<cr>", { desc = "Terminal" })
map("t", "<C-`>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "qq", "<cmd>close<cr>", { desc = "Hide Terminal" })
--nomap("t", "<esc>")

--telescope
map({ "n", "i" }, "<c-p>", "<cmd>Telescope find_files<cr>", { desc = "Find File" })
map({ "n", "i" }, "<c-f>", "<ESC>/", { desc = "Find Text" })
map({ "n", "i" }, "<C-S-f>", "<cmd>Telescope live_grep<cr>", { desc = "Find Text" })
--nomap("n", "<leader>pt")

--tree
map("n", "<c-b>", "<cmd>Neotree focus<cr>", { desc = "Focus NvimTree" })
map("n", "<c-n>", "<cmd>Neotree toggle<cr>", { desc = "Toggle NvimTree" })

--lazygit
map({ "n", "i" }, "<c-g>", function()
	lazygit:toggle()
end, { desc = "Toggle LazyGit" })

--conform
map({ "n" }, "<leader>fm", function()
	require("conform").format()
	print("File Format with conform")
end, { desc = "Conform" })

