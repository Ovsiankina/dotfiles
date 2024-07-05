return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()

    --          ╭─────────────────────────────────────────────────────────╮
    --          │                          Remap                          │
    --          ╰─────────────────────────────────────────────────────────╯

    local wk = require("which-key")
    wk.register({
      ["<leader>m"] = {
        name = "Markdown",
        ["p"] = { mode = "n", "<Cmd>MarkdownPreviewToggle<CR>", "Markdown [p]review" },
      },
    })
  end,
}
