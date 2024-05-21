------------------------------------------------------------------------------------------------------------------------
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

map({ "n", "v" }, ";", ":")
map({ "n", "i", "v" }, "qq", "<ESC>", { desc = "Escape insert and view mode" })

map("n", "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "File Format with conform" })

--save
map({ "n", "i", "v" }, "<c-s>", "<cmd>w<cr>", { desc = "Save file" })

-- move and copy line
map({ "n", "i" }, "<A-j>", "<cmd>move .+1<CR>", { desc = "Move Line Down" })
map({ "n", "i" }, "<A-k>", "<cmd>move .-2<CR>", { desc = "Move Line Up" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move Line Down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move Line Up" })

map({ "n", "i" }, "<C-A-j>", "<cmd>copy +0<CR>", { desc = "Dup Line Down" })
map({ "n", "i" }, "<C-A-k>", "<cmd>copy -1<CR>", { desc = "Dup Line Up" })
map("v", "<C-A-j>", function()
	local lastline = vim.fn.getpos("'>")[2]
	local fistline = vim.fn.getpos("'<")[2]
	local currentline = vim.fn.getpos(".")[2]
	vim.cmd.normal({ "Y", bang = true })
	vim.cmd.normal({ lastline - currentline .. "j", bang = true })
	vim.cmd.normal({ "p", bang = true })
	vim.cmd.normal({ "v" .. lastline - fistline .. "j", bang = true })
end)
map("v", "<C-A-k>", function()
	local lastline = vim.fn.getpos("'>")[2]
	local fistline = vim.fn.getpos("'<")[2]
	local currentline = vim.fn.getpos(".")[2]
	vim.cmd.normal({ "Y", bang = true })
	vim.cmd.normal({ currentline - fistline .. "k", bang = true })
	vim.cmd.normal({ "p", bang = true })
	vim.cmd.normal({ "v" .. lastline - fistline .. "j", bang = true })
end)

--undo and redo
map({ "n", "i", "v" }, "<C-z>", "<cmd>undo<CR>", { desc = "Undo" })
map({ "n", "i", "v" }, "<C-S-z>", "<cmd>redo<CR>", { desc = "Redo" })

-- cursor
map({ "n", "i" }, "<C-a>", "<ESC>ggVG", { desc = "Select All" })
map({ "n", "i" }, "<C-d>", "<ESC>viws", { desc = "Delete Word" })
map("i", "<c-j>", "<down>", { desc = "Move cursor down" })
map("i", "<c-k>", "<up>", { desc = "Move cursor up" })
map("i", "<c-h>", "<left>", { desc = "Move cursor left" })
map("i", "<c-l>", "<right>", { desc = "Move cursor right" })

-- buffer
map({ "n", "i" }, "qw", function()
	require("bufdelete").bufdelete(0, true)
end, { desc = "Close Buffer" })
map("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<s-tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })

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

--Git
map({ "n", "i" }, "<c-g>", function()
	lazygit:toggle()
end, { desc = "Toggle LazyGit" })
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
map("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})

--conform
map({ "n" }, "<leader>fm", function()
	require("conform").format()
	print("File Format with conform")
end, { desc = "Conform" })

-- code actions
map({ "n", "v", "i" }, "<A-cr>", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code action" })

-- comment
map({ "n", "i" }, "<c-/>", "<esc>gccvkkkk", { desc = "Comment line", remap = true })
map({ "v" }, "<c-/>", "gc", { desc = "Comment Select lines", remap = true })

-- copy paste to clipboard using neovide
if vim.g.neovide then
	vim.api.nvim_set_keymap("v", "<sc-c>", '"+y', { noremap = true })
	vim.api.nvim_set_keymap("n", "<sc-v>", '"+P', { noremap = true })
	vim.api.nvim_set_keymap("v", "<sc-v>", '"+P', { noremap = true })
	vim.api.nvim_set_keymap("i", "<sc-v>", '<ESC>"+Pi', { noremap = true })
end
