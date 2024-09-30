-- Line numbers vim.opt.nu = true
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4        -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 4     -- Number of spaces used for each step of (auto)indent
vim.opt.expandtab = false   -- Use spaces instead of tabs
vim.opt.smarttab = false    -- Insert spaces based on shiftwidth and tabstop
vim.opt.autoindent = true  -- Copy indent from the previous line
vim.opt.smartindent = true -- Smart indentation based on file type
vim.opt.softtabstop = 4    -- Number of spaces a Tab counts for while editing


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
