return {
  {
    "LudoPinelli/comment-box.nvim",
    config = function()
      -- ── Named parts ─────────────────────────────────────────────────────

      -- Simple line

      -- ──────────────────────────────────────────────────────────────────────

      --                                                           ▲
      --   Marked comments                                         █
      --                                                           ▼

      -- Remove comment box or normal comment

      -- method 4
      local wk = require("which-key")
      wk.register({
        ["<leader>C"] = {
          name = "Comments boxes",
          silent = true,
          noremap = true,
          ["b"] = { mode = { "n", "v" }, "<Cmd>CBccbox<CR>", "[b]ox Title" },
          ["t"] = { mode = { "n", "v" }, "<Cmd>CBllline<CR>", "[t]itled Line" },
          ["l"] = { mode = { "n", "v" }, "<Cmd>CBline<CR>", "Simple [l]ine" },
          ["m"] = { mode = { "n", "v" }, "<Cmd>CBllbox14<CR>", "[m]arked" },
          ["r"] = { mode = { "n", "v" }, "<Cmd>CBd<CR>", "[r]emove a box" },
        },
      })
    end,
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = true,
  },
}
