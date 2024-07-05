return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  cmd = "Trouble",
  auto_close = true,

  -- BUG: Trouble does not use icons proprely (letters instead)

  keys = function()
    -- BUG: xL and xQ doesn't work
    -- FIX: these two below does not work
    local wk = require("which-key")
    wk.register({
      ["<leader>x"] = {
        name = "Trouble",
        silent = true,
        noremap = true,
        ["x"] = { mode = "n", "<cmd>Trouble diagnostics toggle<cr>", "[x]Diagnostics" },
        ["X"] = { mode = "n", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "[X]Buffer Diagnostics" },
        ["l"] = { mode = "n", "<cmd>Trouble loclist toggle<cr>", "[L]ocation List" },
        ["Q"] = { mode = "n", "<cmd>Trouble qflist toggle<cr>", "[Q]uickfix List" },
        ["t"] = { mode = "n", "<cmd>Trouble todo<CR>", "[t]odo" },
        ["s"] = { mode = "n", "<cmd>Trouble symbols toggle focus=false<cr>", "[s]ymbols" },
        ["L"] = {
          mode = "n",
          "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
          "[L]SP Definitions / references / ...",
        },
      },
    })
  end,
}
