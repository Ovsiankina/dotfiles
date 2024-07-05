-- TODO: customize it | https://github.com/akinsho/bufferline.nvim
-- add tiagovla/scope.nvim

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    -- WARN: Conflict with <leader>b for :Ex
    -- { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    -- { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    -- { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
    -- { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    -- { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    -- TODO: modify these 4 keymaps below
    { "[b",    "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "]b",    "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[B",    "<cmd>BufferLineMovePrev<cr>",  desc = "Move buffer prev" },
    { "]B",    "<cmd>BufferLineMoveNext<cr>",  desc = "Move buffer next" },
    { "<S-d>",    "<cmd>bd<cr>",  desc = "Delete current buffer" },
  },
  opts = {
    options = {
      -- stylua: ignore
      -- stylua: ignore
      diagostics = "nvim_lsp",
      always_show_bufferline = false,
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
      -- suggestion: Use this to get dev icons ? if possible
      -----@param opts bufferline.IconFetcherOpts
      --get_element_icon = function(opts)
      --	return LazyVim.config.icons.ft[opts.filetype]
      --end,
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
      callback = function()
        vim.schedule(function()
          pcall(nvim_bufferline)
        end)
      end,
    })
  end,
}
