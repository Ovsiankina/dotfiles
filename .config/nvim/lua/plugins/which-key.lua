return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- TODO: place all groupe name here
		-- e.g:
		-- opts = {
		--   plugins = { spelling = true },
		--   defaults = {
		--     mode = { "n", "v" },
		--     ["g"] = { name = "+goto" },
		--     ["gs"] = { name = "+surround" },
		--     ["z"] = { name = "+fold" },
		--     ["]"] = { name = "+next" },
		--     ["["] = { name = "+prev" },
		--     ["<leader><tab>"] = { name = "+tabs" },
		--     ["<leader>b"] = { name = "+buffer" },
		--     ["<leader>c"] = { name = "+code" },
		--     ["<leader>f"] = { name = "+file/find" },
		--     ["<leader>g"] = { name = "+git" },
		--     ["<leader>gh"] = { name = "+hunks", ["_"] = "which_key_ignore" },
		--     ["<leader>q"] = { name = "+quit/session" },
		--     ["<leader>s"] = { name = "+search" },
		--     ["<leader>u"] = { name = "+ui" },
		--     ["<leader>w"] = { name = "+windows" },
		--     ["<leader>x"] = { name = "+diagnostics/quickfix" },
		--   },
		-- }
		--
		-- nitpick: rewrite all the remaps in all plugins files
	},
}
