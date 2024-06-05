-- Remap <space> to execute the vim command :Ex while in NORMAL MODE
vim.g.mapleader = " "                        -- The leader ( <space> )
-- replaced by oil.lua
-- vim.keymap.set("n", "<leader>b", vim.cmd.Ex) -- in normal mode, leader <space>, which command (Ex)

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- LSP and code actions
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})       -- Definitions
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {}) -- Go to definitions
vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})

---------- Pane navigation ----------

vim.keymap.set("n", "<c-k>", "wincmd k<CR>")
vim.keymap.set("n", "<c-j>", "wincmd j<CR>")
vim.keymap.set("n", "<c-h>", "wincmd h<CR>")
vim.keymap.set("n", "<c-l>", "wincmd l<CR>")

---------- Quick save ----------
vim.keymap.set("n", "<leader>w", ":w<CR>")
