return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>TroubleToggle document_diagnostics<cr>",
      desc = "Document Diagnostics (Trouble)",
    },
    {
      "<leader>x",
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      desc = "Workspace Diagnostics (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>TroubleToggle loclist<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>TroubleToggle quickfix<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
  opts = {}, -- Use default options or add custom configurations if needed
}
-- {
--   "<leader>cs",
--   "<cmd>Trouble symbols toggle focus=false<cr>",
--   desc = "Symbols (Trouble)",
-- },
-- {
--   "<leader>cl",
--   "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
--   desc = "LSP Definitions / references / ... (Trouble)",
-- },
