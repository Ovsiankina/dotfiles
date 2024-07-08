-- Remap <space> to execute the vim command :Ex while in NORMAL MODE
vim.g.mapleader = " " -- The leader ( <space> )
-- replaced by oil.lua
-- vim.keymap.set("n", "<leader>b", vim.cmd.Ex) -- in normal mode, leader <space>, which command (Ex)

-- TODO: write these remaps with which-key plugin

--          ╭─────────────────────────────────────────────────────────╮
--          │                          Remap                          │
--          ╰─────────────────────────────────────────────────────────╯

local keymap = vim.keymap.set

---------- Pane navigation ----------

keymap("n", "<c-k>", "wincmd k<CR>")
keymap("n", "<c-j>", "wincmd j<CR>")
keymap("n", "<c-h>", "wincmd h<CR>")
keymap("n", "<c-l>", "wincmd l<CR>")

---------- Quick save ----------
keymap("n", "<leader>w", ":w<CR>", {desc = "Quick save"})
