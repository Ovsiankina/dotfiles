return {
    {
        "LudoPinelli/comment-box.nvim",

        -- ── Named parts ─────────────────────────────────────────────────────

        -- Simple line

        -- ──────────────────────────────────────────────────────────────────────

        --                                                           ▲
        --   Marked comments                                         █
        --                                                           ▼

        -- Remove comment box or normal comment

        keys = {
            {
                "<leader>Cb",
                "<Cmd>CBccbox<CR>",
                mode = { "n", "v" },
                silent = true,
                noremap = true,
                desc = "[b]ox Title",
            },
            {
                "<leader>Ct",
                "<Cmd>CBllline<CR>",
                mode = { "n", "v" },
                silent = true,
                noremap = true,
                desc = "[t]itled Line",
            },
            {
                "<leader>Cl",
                "<Cmd>CBline<CR>",
                mode = { "n", "v" },
                silent = true,
                noremap = true,
                desc = "Simple [l]ine",
            },
            {
                "<leader>Cm",
                "<Cmd>CBllbox14<CR>",
                mode = { "n", "v" },
                silent = true,
                noremap = true,
                desc = "[m]arked",
            },
            {
                "<leader>Cr",
                "<Cmd>CBd<CR>",
                mode = { "n", "v" },
                silent = true,
                noremap = true,
                desc = "[r]emove a box",
            },
        },
    },
    {
        "folke/ts-comments.nvim",
        opts = {},
        event = "VeryLazy",
        enabled = true,

        -- `gcc` to comment and uncomment line under cursor
    },
}
