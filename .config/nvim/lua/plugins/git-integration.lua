return {
    -- Git commands integrated into neovim
    {
        "tpope/vim-fugitive",
    },
    -- Previews, blame, etc..
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" }, -- Load on buffer read or new file
        opts = {
            signs = {
                delete = { text = "󰍵" },
                changedelete = { text = "󱕖" },
            },
        },
        keys = {
            -- Git commands
            { "<leader>G",  group = "Git" },
            { "<leader>GA", "<cmd>Git add .<CR>",             mode = "n", desc = "Git [A]dd ." },
            { "<leader>GC", "<cmd>Git commit<CR>",            mode = "n", desc = "Git [C]ommit" },
            { "<leader>Gh", "<cmd>Gitsigns preview_hunk<CR>", mode = "n", desc = "[p]review hunk" },
            { "<leader>Gr", "<cmd>Gitsigns reset_hunk<CR>",   mode = "n", desc = "[r]eset hunk" },
            { "<leader>GD", "<cmd>Gitsigns diffthis<CR>",     mode = "n", desc = "[D]iff this" },
            {
                "<leader>Gd",
                "<cmd>Gdiffsplit<CR>",
                mode = "n",
                desc = "[d]iff split: working tree vs. staged",
            },
            { "<leader>Gb",  "<cmd>Gitsigns toggle_current_line_blame<CR>", mode = "n", desc = "[b]lame current line" },

            -- Git visualisation
            { "<leader>gvb", "<cmd>Flog<CR>",                               mode = "n", desc = "(b)ranches" },
            { "<leader>gvs", "<cmd>Flogsplit<CR>",                          mode = "n", desc = "(s)plit" },
            -- { "<leader>gvg", "<cmd>Floggit<CR>", mode = "n", desc = "(g)it" },
            --
        },
    },
    -- Git branches visualisation (:Flog)
    {
        "rbong/vim-flog",
        cmd = { "Flog", "Flogsplit", "Floggit" },
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = true,
    },
    {
        "sindrets/diffview.nvim",
        --                                                           ▲
        --   TODO: config diffview                                   █
        --                                                           ▼
    },
}
