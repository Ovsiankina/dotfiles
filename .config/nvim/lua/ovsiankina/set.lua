-- Line numbers vim.opt.nu = true
vim.opt.number = true
vim.opt.relativenumber = true

-- 4 spaces indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

-- Prevent vim backups
vim.opt.swapfile = false
-- vim.opt.backup = false
-- allow undotree to access old versions from days ago
local home = os.getenv("HOME") or os.getenv("USERPROFILE")
vim.opt.undodir = home .. "/.vim/undodir"
vim.opt.undofile = true

-- Make highlights incremental
-- ( '/vim.* =' will only highlights from 'v' to '=' )
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- idk colors I guess
vim.opt.termguicolors = true

-- Always keep at least 8 lines from the bottom to where I work
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@") -- IDK

vim.opt.updatetime = 50 -- Update time
vim.opt.colorcolumn = "80"

-- VimTex required options
vim.o.encoding = "utf-8"

-- Define global variables for diagnostic icons
vim.g.diagnostic_icons = {
	error = " ",
	warning = " ",
	info = " ",
	hint = " ",
	bug = " ",
	perf = "󰅒 ",
	hack = " ",
	note = "󰍨 ",
    test = " "
}

-- Sign column
local icons = vim.g.diagnostic_icons
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = icons.error,
			[vim.diagnostic.severity.WARN] = icons.warning,
			[vim.diagnostic.severity.INFO] = icons.info,
			[vim.diagnostic.severity.HINT] = icons.hint,
		},
	},
})
