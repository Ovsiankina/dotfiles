-- Remap <space> to execute the vim command :Ex while in NORMAL MODE
vim.g.mapleader = " " -- The leader ( <space> )
-- replaced by oil.lua
-- vim.keymap.set("n", "<leader>b", vim.cmd.Ex) -- in normal mode, leader <space>, which command (Ex)

-- TODO: write these remaps with which-key plugin
--
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
keymap("n", "<leader>w", ":w<CR>", { desc = "Quick save" })
-- Force write in readonly (vim sudo trick)
keymap('c', 'w!!', 'w !sudo tee > /dev/null %', { noremap = true })

---------- Remap "+y to <c-v> ----------
keymap("n", "<C-y>", '"+y', { desc = "Remap +y to <c-v>" })

-- Compile Arduino sketch with arduino-cli
keymap("n", "<leader>ac", ":!arduino-cli compile --fqbn arduino:avr:uno %:p:h<CR>", { desc = "Compile Sketch" })

-- Upload Arduino sketch to the board
keymap("n", "<leader>au", ":!arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:uno %:p:h<CR>",
    { desc = "Upload Sketch" })

vim.keymap.set("n", "<leader>mv", function()
  local image = require("image")
  local is_enabled = image.is_enabled()

  -- Toggle RenderMarkdown
  vim.cmd("RenderMarkdown toggle")

  -- If it was disabled and now is enabled, enable image
  -- We delay checking with a timer to wait for RenderMarkdown to activate
  vim.defer_fn(function()
    -- Simple re-check: assume toggling flips the state
    if not is_enabled then
      image.enable()
    else
      image.disable()
    end
  end, 100) -- Wait 100ms (adjustable delay)
end, { desc = "Toggle MarkView and sync image.nvim" })
