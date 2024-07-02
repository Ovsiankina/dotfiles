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
      m = {
        mode = { "n" },
        name = " Markdown",
        p = { "MarkdownPreviewToggle<CR>", "Markdown (p)review" },
      },
    }, { prefix = "<leader>" })
  end,

}
