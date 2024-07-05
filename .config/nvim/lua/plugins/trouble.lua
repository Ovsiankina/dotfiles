return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  cmd = "Trouble",
  auto_close = true,

  -- BUG: Trouble does not use icons proprely (letters instead)

  keys = function()
    local wk = require("which-key")
    wk.register({
      ["<leader>x"] = {
        name = "Trouble",
        x = { ":Trouble diagnostics toggle<cr>", "Diagnostics (Trouble)" },
        X = { ":Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics (Trouble)" },
        -- BUG: xL and xQ doesn't work
        L = { ":Trouble loclist toggle<cr>", "Location List (Trouble)" },
        Q = { ":Trouble qflist toggle<cr>", "Quickfix List (Trouble)" },
        t = { ":Trouble todo<CR>", "Todo telescope" },
      },

      -- FIX: these two below does not work
      ["<leader>c"] = {
        s = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols (Trouble)" },
        l = { "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", "LSP Definitions / references / ... (Trouble)" },
      },
    }, { mode = "n", noremap = true, silent = true })
  end,
}
