return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },

  config = function()
    --          ╭─────────────────────────────────────────────────────────╮
    --          │                          Remap                          │
    --          ╰─────────────────────────────────────────────────────────╯

    local wk = require("which-key")
    wk.register({
      N = {
        mode = { "n" },
        name = " Neotree filesystem",
        l = { ":Neotree filesystem reveal left<CR>", "Reveal neotree (l)eft" },
        f = { ":Neotree buffers reveal float<CR>", "Reveal neotree (f)oat" },
      },
    }, { prefix = "<leader>" })
  end,
}
