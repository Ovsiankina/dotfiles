return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@diagnostic disable-next-line: undefined-doc-name
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = false },
        indent = { enabled = true, animate = { enabled = false } },
        input = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 3000,
        },
        picker = { enabled = true },
        quickfile = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = true },
        styles = {
            notification = {
                -- wo = { wrap = true } -- Wrap notifications
            }
        }
    },
    keys = {
        { "<leader>z",   function() Snacks.zen() end,                     desc = "Toggle Zen Mode" },
        { "<leader>n",   function() Snacks.notifier.show_history() end,   desc = "Notification History" },
        { "<leader>gB",  function() Snacks.gitbrowse() end,               desc = "Git Browse",                  mode = { "n", "v" } },
        { "<leader>gb",  function() Snacks.git.blame_line() end,          desc = "Git Blame Line" },
        { "<leader>gf",  function() Snacks.lazygit.log_file() end,        desc = "Lazygit Current File History" },
        { "<leader>lg",  function() Snacks.lazygit() end,                 desc = "Lazygit" },
        { "<leader>log", function() Snacks.lazygit.log() end,             desc = "Lazygit Log (cwd)" },
        { "<leader>un",  function() Snacks.notifier.hide() end,           desc = "Dismiss All Notifications" },
        { "<c-/>",       function() Snacks.terminal() end,                desc = "Toggle Terminal" },
        { "<c-_>",       function() Snacks.terminal() end,                desc = "which_key_ignore" },
        { "]]",          function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference",              mode = { "n", "t" } },
        { "[[",          function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference",              mode = { "n", "t" } },
        {
            "<leader>N",
            desc = "Neovim News",
            function()
                Snacks.win({
                    file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
                    width = 0.6,
                    height = 0.6,
                    wo = {
                        spell = false,
                        wrap = false,
                        signcolumn = "yes",
                        statuscolumn = " ",
                        conceallevel = 3,
                    },
                })
            end,
        }
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.bt = function()
                    Snacks.debug.backtrace()
                end
                vim.print = _G.dd -- Override print to use snacks for `:=` command

                -- Create some toggle mappings
                Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
                    :map("<leader>uc")
                Snacks.toggle.treesitter():map("<leader>uT")
                Snacks.toggle.inlay_hints():map("<leader>uh")
                Snacks.toggle.indent():map("<leader>ug")
                Snacks.toggle.dim():map("<leader>uD")
            end,
        })
    end,
}
