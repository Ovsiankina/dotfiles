-- TODO: customize it | https://github.com/akinsho/bufferline.nvim
-- add tiagovla/scope.nvim

return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = {
    options = {
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

    local wk = require("which-key")
    wk.register({
      ["<leader>B"] = {
        name = "Buffer",
        ["p"] = { mode = "n", "<Cmd>BufferLineTogglePin<CR>", "Toggle Pin" },
        ["P"] = { mode = "n", "<Cmd>BufferLineGroupClose ungrouped<CR>", "Delete Non-Pinned Buffers" },
        ["o"] = { mode = "n", "<Cmd>BufferLineCloseOthers<CR>", "Delete Other Buffers" },
        ["r"] = { mode = "n", "<Cmd>BufferLineCloseRight<CR>", "Delete Buffers to the Right" },
        ["l"] = { mode = "n", "<Cmd>BufferLineCloseLeft<CR>", "Delete Buffers to the Left" },
      },
      ["<C-x>"] = { mode = "n", "<cmd>bd<cr>", "[x]Delete current buffer" },
      ["H"] = { mode = "n", "<cmd>BufferLineCyclePrev<cr>", "Prev Buffer" },
      ["L"] = { mode = "n", "<cmd>BufferLineCycleNext<cr>", "Next Buffer" },
      ["[b"] = { mode = "n", "<cmd>BufferLineCyclePrev<cr>", "Prev Buffer" },
      ["]b"] = { mode = "n", "<cmd>BufferLineCycleNext<cr>", "Next Buffer" },
      ["[B"] = { mode = "n", "<cmd>BufferLineMovePrev<cr>", "Move buffer prev" },
      ["]B"] = { mode = "n", "<cmd>BufferLineMoveNext<cr>", "Move buffer next" },
    })
  end,
}
