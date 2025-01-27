-- TODO: Change UI to match better chadnv's version
return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "nvim-telescope/telescope-project.nvim",
        dependencies = { "nvim-telescope/telescope-file-browser.nvim" },
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        keys = {
            { "<leader>f",   group = "Telescope" },
            { "<leader>fB",  "<Cmd>Telescope file_browser<CR>",       desc = "(B)rowse files" },
            { "<leader>fG",  group = "Git pickers" },
            { "<leader>fGC", "<Cmd>Telescope git_bcommits<CR>",       desc = "Buffer git [C]ommits" },
            { "<leader>fGS", "<Cmd>Telescope git_stash<CR>",          desc = "Git [S]tash" },
            { "<leader>fGb", "<Cmd>Telescope git_branches<CR>",       desc = "Git [b]ranches" },
            { "<leader>fGc", "<Cmd>Telescope git_commits<CR>",        desc = "Git [c]ommits" },
            { "<leader>fGr", "<Cmd>Telescope git_bcommits_range<CR>", desc = "Buffer git commits [r]ange" },
            { "<leader>fGs", "<Cmd>Telescope git_status<CR>",         desc = "Git [s]tatus" },
            { "<leader>fb",  "<Cmd>Telescope buffers<CR>",            desc = "Buffers" },
            { "<leader>ff",  "<Cmd>Telescope find_files<CR>",         desc = "Find Files" },
            { "<leader>fg",  "<Cmd>Telescope live_grep<CR>",          desc = "Live Grep" },
            { "<leader>fh",  "<Cmd>Telescope help_tags<CR>",          desc = "Help Tags" },
            { "<leader>fp",  "<Cmd>Telescope file_browser<CR>",       desc = "Browse (p)rojects" },
            { "<leader>ft",  "<Cmd>TodoTelescope<CR>",                desc = "Todo telescope" },

        },
        config = function()
            local colors = require("catppuccin.palettes").get_palette()
            local telescope_style = "borderless" -- or "borderless", depending on your preference

            local hlgroups = {
                TelescopePromptPrefix = {
                    fg = colors.red,
                    bg = colors.surface0,
                },
                TelescopeNormal = { bg = colors.mantle },
                TelescopePreviewTitle = {
                    fg = colors.base,
                    bg = colors.green,
                },
                TelescopePromptTitle = {
                    fg = colors.base,
                    bg = colors.red,
                },
                TelescopeSelection = { bg = colors.surface0, fg = colors.text },
                TelescopeResultsDiffAdd = { fg = colors.green },
                TelescopeResultsDiffChange = { fg = colors.yellow },
                TelescopeResultsDiffDelete = { fg = colors.red },
                TelescopeMatching = { bg = colors.surface1, fg = colors.blue },
            }

            local styles = {
                borderless = {
                    TelescopeBorder = { fg = colors.mantle, bg = colors.mantle },
                    TelescopePromptBorder = { fg = colors.surface0, bg = colors.surface0 },
                    TelescopePromptNormal = { fg = colors.text, bg = colors.surface0 },
                    TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
                    TelescopePromptPrefix = { fg = colors.red, bg = colors.surface0 },
                },
                bordered = {
                    TelescopeBorder = { fg = colors.surface1 },
                    TelescopePromptBorder = { fg = colors.surface1 },
                    TelescopeResultsTitle = { fg = colors.base, bg = colors.green },
                    TelescopePreviewTitle = { fg = colors.base, bg = colors.blue },
                    TelescopePromptPrefix = { fg = colors.red, bg = colors.base },
                    TelescopeNormal = { bg = colors.base },
                    TelescopePromptNormal = { bg = colors.base },
                },
            }

            local result = vim.tbl_deep_extend("force", hlgroups, styles[telescope_style])

            for group, colors in pairs(result) do
                vim.api.nvim_set_hl(0, group, colors)
            end

            require("telescope").setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-h>"] = "which_key",
                            ["<C-j>"] = "move_selection_next",
                            ["<C-k>"] = "move_selection_previous",
                        },
                    },
                    layout_strategy = 'horizontal'
                },
                pickers = {
                    find_files = {
                        hidden = true,
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({
                            -- even more opts
                        }),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
