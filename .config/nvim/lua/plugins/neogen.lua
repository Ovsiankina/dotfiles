return {
    "danymat/neogen",
    config = function()
        require("neogen").setup({
            languages = {
                c = {
                    template = {
                        annotation_convention =
                        "xmldoc"                 -- for a full list of annotation_conventions, see supported-languages below,
                    }
                },
            }
        })
        local wk = require("which-key")
        -- method 4
        wk.register({
            ["<leader>n"] = {
                name = "Annotation generation",
                ["f"] = {
                    mode = { "n", "v" },
                    ":lua  require('neogen').generate()<CR>",
                    "Generate annotation for [f]unctions",
                },
                ["c"] = {
                    mode = { "n", "v" },
                    ":lua  require('neogen').generate({ type = 'class' })<CR>",
                    "Generate annotation for [c]lasses",
                },
                ["t"] = {
                    mode = { "n", "v" },
                    ":lua  require('neogen').generate({ type = 'type' })<CR>",
                    "Generate annotation for [t]ype",
                },
                ["F"] = {
                    mode = { "n", "v" },
                    ":lua  require('neogen').generate({ type = 'file' })<CR>",
                    "Generate annotation for [F]ile",
                },
            },
        })
    end,
}
-- TODO: add cs xml annotation
