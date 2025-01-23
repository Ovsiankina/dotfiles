return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        -- or                              , branch = '0.1.x',
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "nvim-telescope/telescope-project.nvim",
        dependencies = { "nvim-telescope/telescope-file-browser.nvim" },
    },

    -- Telescope extension to use code action with telescope
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
            -- This is your opts table
            dofile(vim.g.base46_cache .. "telescope")
            require("telescope").setup({
                defaults = {
                    -- Default configuration for telescope goes here:
                    -- config_key = value,
                    prompt_prefix = "   ",
                    selection_caret = " ",
                    entry_prefix = " ",
                    sorting_strategy = "ascending",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.55,
                        },
                        width = 0.87,
                        height = 0.80,
                    },
                    mappings = {
                        i = {
                            -- map actions.which_key to <C-h> (default: <C-/>)
                            -- actions.which_key shows the mappings for your picker,
                            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                            ["<C-h>"] = "which_key",
                            ["<C-j>"] = "move_selection_next",
                            ["<C-k>"] = "move_selection_previous",
                        },
                    },
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
