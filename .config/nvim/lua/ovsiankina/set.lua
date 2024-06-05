-- Line numbers vim.opt.nu = true
vim.opt.relativenumber = true

-- 4 spaces indents
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Allow to chose with a command (TODO) catpuccin theme
-- TODO Add command to change this to dark or light
vim.g.background = "light"

-- Disable line wrap
vim.opt.wrap = false

-- Prevent vim backups
vim.opt.swapfile = false
-- vim.opt.backup = false
-- allow undotree to access old versions from days ago
local home = os.getenv('HOME') or os.getenv('USERPROFILE')
vim.opt.undodir = home .. '/.vim/undodir'
vim.opt.undofile = true

-- Make highlights incremental 
-- ( '/vim.* =' will only highlights from 'v' to '=' )
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- idk colors I guess
vim.opt.termguicolors = true

-- Always keep at least 8 lines from the bottom to where I work
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@') -- IDK

vim.opt.updatetime = 50 -- Update time
vim.opt.colorcolumn = '80'
vim.g.mapleader = ' '
