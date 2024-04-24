vim.g.mapleader = " "
vim.g.background = "light"
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.shell = "zsh"
vim.opt.whichwrap:append "<>[]hl"
vim.opt.swapfile = false
vim.opt.shortmess:append "sI"
vim.opt.fillchars = { eob = " " }

vim.o.undofile = true
vim.o.smartindent = true
vim.o.expandtab = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
-- hide cmdline when not in use
vim.o.cmdheight = 0


-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.o.number = true

vim.opt.termguicolors = true

