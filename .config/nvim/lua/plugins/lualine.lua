return {
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                theme = "catppuccin",
                globalstatus = true,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = {
                    "filetype",
                    "filename"
                },
                lualine_x = {
                    function()
                        local msg = ' LSP UNACTIVE'
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
                    -- "encoding",
                    "fileformat",
                },
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
