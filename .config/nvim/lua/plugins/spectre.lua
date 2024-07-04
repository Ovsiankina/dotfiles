return {
  "nvim-pack/nvim-spectre",

  vim.keymap.set("n", "<leader><C-s>", '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre",
  }),
  vim.keymap.set("n", "<leader><C-w>", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file",
  }),
}
