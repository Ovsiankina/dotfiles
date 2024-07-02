return {
  "danymat/neogen",
  config = function()
    require('neogen').setup {}
    local wk = require("which-key")
    wk.register({
      n = {
        mode = { "n", "v" },
        silent = true,      -- use `silent` when creating keymaps
        noremap = true,     -- use `noremap` when creating keymaps
        name = " Annotation generation",
        f = { ":lua require('neogen').generate()<CR>", "Generate annotation for (f)unctions" },
        c = { ":lua require('neogen').generate({ type = 'class' })<CR>", "Generate annotation for (c)lasses" },
        t = { ":lua require('neogen').generate({ type = 'type' })<CR>", "Generate annotation for (t)ype" },
        F = { ":lua require('neogen').generate({ type = 'file' })<CR>", "Generate annotation for (F)ile" },
      },
    }, { prefix = "<leader>" })
  end,
}
-- vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
