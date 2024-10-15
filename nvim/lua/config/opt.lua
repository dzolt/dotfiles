vim.opt.confirm = true
vim.opt.cursorline = true --enable highlighting of current line

vim.opt.nu = true --enable line numbers
vim.opt.relativenumber = true --enable relative number of line

vim.opt.tabstop = 4 --set the number of spaces that the tab represents
vim.opt.softtabstop = 4 --set the number of spaces that tab represents while editing
vim.opt.shiftwidth = 4 --set the number of spaces to use for each step of autoindent
vim.opt.expandtab = true --use spaces instead of tabs

vim.opt.smartindent = true

vim.opt.wrap = false --disables line wrapping

vim.opt.swapfile = false --disables swap file creation
vim.opt.backup = false --disable backup files creation
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir' --sets the directory for storing undo files
vim.opt.undofile = true --enables persistent undo, allowing you to undo changes after reopening a file

vim.opt.incsearch = true --enables incremental search, showing matches as you type

vim.opt.termguicolors = true -- enables true color support in the terminal

vim.opt.scrolloff = 8 --keeps 8 lines visible above and below the cursor while scrolling
vim.opt.signcolumn = 'yes' -- shows the sign column which is used for displaying markers like breakpoints
vim.opt.isfname:append '@-@' --adds @-@ to the list of characters considered part of a file name

vim.opt.updatetime = 50 -- time in ms to wait before triggering the swap file and CursorHeld event

vim.opt.colorcolumn = '140' --highlights 140th column, helping keep lines withing certain length
