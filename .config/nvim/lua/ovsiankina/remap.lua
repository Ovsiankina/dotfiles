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

--── Resize panels using Ctrl+Shift+<hjkl> ───────────────────────────
keymap("n", "<C-S-k>", ":resize +2<CR>", { noremap = true, desc = "Increase height" })
keymap("n", "<C-S-j>", ":resize -2<CR>", { noremap = true, desc = "Decrease height" })
keymap("n", "<C-S-h>", ":vertical resize -2<CR>", { noremap = true, desc = "Decrease width" })
keymap("n", "<C-S-l>", ":vertical resize +2<CR>", { noremap = true, desc = "Increase width" })

---------- Quick save ----------
keymap("n", "<leader>w", ":w<CR>", {desc = "Quick save"})

---------- Remap "+y to <c-v> ----------
keymap("n","<C-y>", '"+y', {desc = "Remap +y to <c-v>"})

-- Compile Arduino sketch with arduino-cli
keymap("n", "<leader>ac", ":!arduino-cli compile --fqbn arduino:avr:uno %:p:h<CR>", { desc = "Compile Sketch" })

-- Upload Arduino sketch to the board
keymap("n", "<leader>au", ":!arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:uno %:p:h<CR>", { desc = "Upload Sketch" })
