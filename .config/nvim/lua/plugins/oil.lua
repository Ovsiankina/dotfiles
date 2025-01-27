return {
    "stevearc/oil.nvim",
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },

    opts = {
        default_file_explorer = true,
        win_options = {
            wrap = false,
            signcolumn = "yes",
            cursorcolumn = false,
            foldcolumn = "0",
            spell = false,
            list = false,
            conceallevel = 3,
            concealcursor = "nvic",
        },
        -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
        delete_to_trash = true,
        -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
        skip_confirm_for_simple_edits = false,
        -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
        -- (:help prompt_save_on_select_new_entry)
        prompt_save_on_select_new_entry = true,
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            -- ["<C-V>"] = "actions.select_vsplit",
            ["<C-S>"] = "actions.select_split",
            ["<C-p>"] = "actions.preview",
            ["<C-c>"] = "actions.close",
            ["<C-r>"] = "actions.refresh",
            ["<leader>b"] = "actions.parent",
            ["-"] = "actions.open_cwd",
            ["`"] = "actions.cd",
            ["~"] = "actions.tcd",
            ["gs"] = "actions.change_sort",
            ["gx"] = "actions.open_external",
            ["g."] = "actions.toggle_hidden",
            ["g\\"] = "actions.toggle_trash",
        },
        -- Set to false to disable all of the above keymaps
        use_default_keymaps = false,
        view_options = {
            -- Show files and directories that start with "."
            show_hidden = true,
            -- This function defines what is considered a "hidden" file
            is_hidden_file = function(name, bufnr)
                return vim.startswith(name, ".")
            end,
            -- Sort file names in a more intuitive order for humans. Is less performant,
            -- so you may want to set to false if you work with large directories.
            natural_order = false,
            sort = {
                -- sort order can be "asc" or "desc"
                -- see :help oil-columns to see which columns are sortable
                { "type", "asc" },
                { "name", "asc" },
            },
        },
        -- Configuration for the floating window in oil.open_float
        float = {
            -- Padding around the floating window
            padding = 2,
            max_width = 0.8,
            max_height = 0.8,
            border = "rounded",
            win_options = {
                winblend = 0,
            },
            -- This is the config that will be passed to nvim_open_win.
            -- Change values here to customize the layout
            override = function(conf)
                return conf
            end,
        },
        -- Configuration for the actions floating preview window
        preview = {
            -- TODO: find a way to make the floating window more like telescope
            -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
            -- min_width and max_width can be a single value or a list of mixed integer/float types.
            -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
            max_width = 0.9,
            -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
            min_width = { 40, 0.4 },
            -- optionally define an integer/float for the exact width of the preview window
            width = nil,
            -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
            -- min_height and max_height can be a single value or a list of mixed integer/float types.
            -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
            max_height = 0.9,
            -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
            min_height = { 5, 0.1 },
            -- optionally define an integer/float for the exact height of the preview window
            height = nil,
            border = "rounded",
            win_options = {
                winblend = 0,
            },
            -- Whether the preview window is automatically updated when the cursor is moved
            update_on_cursor_moved = true,
        },
    },
    keys = {
        { "<leader>b", "<CMD>Oil --float --preview<CR>", mode = "n", desc = "[b] Open parent directory" },
    },
}
