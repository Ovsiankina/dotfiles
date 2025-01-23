return {
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                theme = "catppuccin",
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                -- lualine_c = {
                -- 	"filename",
                -- 	require("lsp-status").status(),
                -- 	{
                -- 		require("noice").api.statusline.mode.get,
                -- 		cond = require("noice").api.statusline.mode.has,
                -- 		color = { fg = "#ff9e64" },
                -- 	},
                -- 	"lsp_progress", -- Add lsp_progress here
                -- },
                -- lualine_c = {
                --     "filename",
                --     require("lsp-status").status(),
                --     {
                --         function()
                --             local noice_status = require("noice").api.statusline.mode.get()
                --             -- Truncate noice status if it's too long
                --             return noice_status and #noice_status > 50 and noice_status:sub(1, 47) .. "..."
                --                 or noice_status
                --         end,
                --         cond = require("noice").api.statusline.mode.has,
                --         color = { fg = "#ff9e64" },
                --     },
                --     {
                --         function()
                --             -- Truncate LSP progress message if it's too long
                --             local lsp_progress = vim.fn["lsp-status"].status()
                --             return lsp_progress and #lsp_progress > 50 and lsp_progress:sub(1, 47) .. "..."
                --                 or lsp_progress
                --         end,
                --     },
                -- },
                lualine_c = {
                    "filename",
                    function()
                        local msg = 'No Active Lsp'
                        local icon = ' LSP:'
                        local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
                        local clients = vim.lsp.get_clients()
                        if next(clients) == nil then
                            return msg
                        end
                        for _, client in ipairs(clients) do
                            local filetypes = client.config.filetypes
                            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                return icon .. client.name
                            end
                        end
                        return msg
                    end,
                    -- color = { fg = '#ffffff', gui = 'bold' },
                },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            extensions = { "trouble" },
        },
    },
    {
        "arkav/lualine-lsp-progress",
    },
}
