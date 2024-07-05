return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    -- or                              , branch = '0.1.x',
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = { "nvim-telescope/telescope-file-browser.nvim" },
  },

  -- Telescope extension to use code action with telescope
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      -- This is your opts table
      require("telescope").setup({
        defaults = {
          -- Default configuration for telescope goes here:
          -- config_key = value,
          mappings = {
            i = {
              -- map actions.which_key to <C-h> (default: <C-/>)
              -- actions.which_key shows the mappings for your picker,
              -- e.g. git_{create, delete, ...}_branch for the git_branches picker
              ["<C-h>"] = "which_key",
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
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

      local wk = require("which-key")
      wk.register({
        ["<leader>f"] = {
          name = "Telescope",
          ["f"] = { mode = "n", "<Cmd>Telescope find_files<CR>", "Find Files" },
          ["g"] = { mode = "n", "<Cmd>Telescope live_grep<CR>", "Live Grep" },
          ["b"] = { mode = "n", "<Cmd>Telescope buffers<CR>", "Buffers" },
          ["h"] = { mode = "n", "<Cmd>Telescope help_tags<CR>", "Help Tags" },
          -- BUG: keyword(args) does not show up in TodoTelescope
          ["t"] = { mode = "n", "<Cmd>TodoTelescope<CR>", "Todo telescope" },
          ["B"] = { mode = "n", "<Cmd>Telescope file_browser<CR>", "(B)rowse files" },
          ["p"] = { mode = "n", "<Cmd>Telescope file_browser<CR>", "Browse (p)rojects" },
        },

        ["<leader>fG"] = {
          name = "Git pickers",
          ["c"] = { mode = "n", "<Cmd>Telescope git_commits<CR>", "Git [c]ommits" },
          ["C"] = { mode = "n", "<Cmd>Telescope git_bcommits<CR>", "Buffer git [C]ommits" },
          ["r"] = { mode = "n", "<Cmd>Telescope git_bcommits_range<CR>", "Buffer git commits [r]ange" },
          ["b"] = { mode = "n", "<Cmd>Telescope git_branches<CR>", "Git [b]ranches" },
          ["s"] = { mode = "n", "<Cmd>Telescope git_status<CR>", "Git [s]tatus" },
          ["S"] = { mode = "n", "<Cmd>Telescope git_stash<CR>", "Git [S]tash" },
        },
      })

      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
    end,
  },
}
