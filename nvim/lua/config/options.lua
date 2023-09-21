-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true

-- vim.cmd [[
-- :augroup numbertoggle
-- :  autocmd!
-- :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
-- :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
-- :augroup END
-- ]]

-- this is autocommand for toggling cursorline on active window
vim.cmd [[
:augroup CursorLine
:    au!
:    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
:    au WinLeave * setlocal nocursorline
:augroup END
]]

vim.opt.cursorline = true
vim.opt.cursorlineopt = "screenline,number"
-- vim.cmd "highlight CursorLine guifg=#11f0c3 guibg=#ff00ff"

-- Enable mouse mode
vim.o.mouse = "a"

-- cursorline
-- cursorcolumn
-- cmd line height
-- vim.o.cmdheight=0
-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true
-- No swap file
vim.opt.swapfile = false
-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

