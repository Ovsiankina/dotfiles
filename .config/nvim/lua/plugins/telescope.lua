return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    -- or                              , branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Telescope extension to use code action with telescope
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      -- This is your opts table
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })

      ----- Remap ----
      --          ╭─────────────────────────────────────────────────────────╮
      --          │                          Remap                          │
      --          ╰─────────────────────────────────────────────────────────╯

      -- BUG:  DO NOT use ':'
      -- use <CMD> instead to enable dot-repeat
      local wk = require("which-key")
      wk.register({
        f = {
          name = " Telescope",
          f = { ":Telescope find_files<CR>", "Find Files" },
          g = { ":Telescope live_grep<CR>", "Live Grep" },
          b = { ":Telescope buffers<CR>", "Buffers" },
          h = { ":Telescope help_tags<CR>", "Help Tags" },
          t = { ":TodoTelescope<CR>", "Todo telescope" },
        },
      }, { prefix = "<leader>" })

      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")

    end,
  },
}
