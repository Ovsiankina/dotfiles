return {
  -- Git commands integrated into neovim
  {
    "tpope/vim-fugitive",
  },
  -- Previews, blame, etc..
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()

      --          ╭─────────────────────────────────────────────────────────╮
      --          │                          Remap                          │
      --          ╰─────────────────────────────────────────────────────────╯

      local wk = require("which-key")
      wk.register({
        g = {
          mode = { "n" },
          name = " Git",
          A = { ":Git add .<CR>", "Git (A)dd ." },
          C = { ":Git commit<CR>", "Git (C)ommit" },
          h = { ":Gitsigns preview_hunk<CR>", "(p)review (h)unk" },
          r = { ":Gitsigns reset_hunk<CR>", "(r)eset (h)unk" },
          D = { ":Gitsigns diffthis<CR>", "(D)iff this" },
          d = { ":Gdiffsplit<CR>", " (d)iff split: working tree vs. staged " },
          b = { ":Gitsigns toggle_current_line_blame<CR>", "Blame current (L)ine" },

          v = {
            name = " Visualisation",
            b = { ":Flog<CR>", " (b)ranches" },
            s = { ":Flogsplit<CR>", " (s)plit" },
            g = { ":Floggit<CR>", " (g)it" },
          },
        },
      }, { prefix = "<leader>" })
    end,
  },
  -- Git branches visualisation (:Flog)
  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
  },
}
