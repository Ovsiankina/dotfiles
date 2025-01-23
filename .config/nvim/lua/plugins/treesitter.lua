return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "elixir",
                "heex",
                "javascript",
                "typescript",
                "tsx",
                "html",
                "python",
                "php",
                "java",
            },
            auto_install = true,
            sync_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,
            },
            indent = {
                enable = true,
            },
            autotag = {
                enable = false,
            },
        })
    end,
}
