return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    theme = "catppuccin",
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "filename", require("lsp-status").status() },
                    -- BUG: lsp-status doesn't show up in lualine
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
                extensions = { "trouble" },
            })
        end,
    },
    {
        "arkav/lualine-lsp-progress",
    },
}
