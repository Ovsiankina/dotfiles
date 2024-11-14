-- TODO: customize it | https://github.com/akinsho/bufferline.nvim
-- add tiagovla/scope.nvim

return {
    -- Full bufferline configuration with LSP diagnostic icons
    -- BUG: bufferline desapear when scope.nvim ?
    -- { "tiagovla/scope.nvim" },
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            -- Command to close a buffer (force-delete)
            close_command = function(n) vim.api.nvim_buf_delete(n, { force = true }) end,
            right_mouse_command = function(n) vim.api.nvim_buf_delete(n, { force = true }) end,
            -- Show LSP diagnostics in the bufferline
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(_, _, diagnostics)
                local symbols = {
                    error = " ",
                    warning = " ",
                    info = " ",
                    hint = "",
                }
                local result = {}
                for name, count in pairs(diagnostics) do
                    if symbols[name] and count > 0 then
                        table.insert(result, symbols[name] .. count)
                    end
                end
                return table.concat(result, " ")
            end,
            -- Customize the appearance
            show_buffer_icons = true,
            show_buffer_close_icons = true,
            show_close_icon = false,
            separator_style = "thin",
            always_show_bufferline = true,
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "left",
                },
            },
        },
    },
    keys = {
        { "<leader>Bp", "<Cmd>BufferLineTogglePin<CR>",            mode = "n", desc = "Toggle Pin" },
        { "<leader>BP", "<Cmd>BufferLineGroupClose ungrouped<CR>", mode = "n", desc = "Delete Non-Pinned Buffers" },
        { "<leader>Bo", "<Cmd>BufferLineCloseOthers<CR>",          mode = "n", desc = "Delete Other Buffers" },
        { "<leader>Br", "<Cmd>BufferLineCloseRight<CR>",           mode = "n", desc = "Delete Buffers to the Right" },
        { "<leader>Bl", "<Cmd>BufferLineCloseLeft<CR>",            mode = "n", desc = "Delete Buffers to the Left" },
        { "<C-x>",      "<cmd>bd<cr>",                             mode = "n", desc = "[x]Delete current buffer" },
        { "H",          "<cmd>BufferLineCyclePrev<cr>",            mode = "n", desc = "Prev Buffer" },
        { "L",          "<cmd>BufferLineCycleNext<cr>",            mode = "n", desc = "Next Buffer" },
        { "[b",         "<cmd>BufferLineCyclePrev<cr>",            mode = "n", desc = "Prev Buffer" },
        { "]b",         "<cmd>BufferLineCycleNext<cr>",            mode = "n", desc = "Next Buffer" },
        { "[B",         "<cmd>BufferLineMovePrev<cr>",             mode = "n", desc = "Move buffer prev" },
        { "]B",         "<cmd>BufferLineMoveNext<cr>",             mode = "n", desc = "Move buffer next" },
    },
}
