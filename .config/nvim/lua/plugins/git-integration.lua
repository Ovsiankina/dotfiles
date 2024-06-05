return {
	-- Git commands integrated into neovim
	{
		"tpope/vim-fugitive",
		config = function()

			----- Remap -----
			vim.keymap.set("n", "<space>gc", ":Git ", {})
		end,
	},
	-- Previews, blame, etc..
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			----- Remap -----
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
		end,
	},
	-- Git branches visualisation (:Flog)
	{
		"rbong/vim-flog",
		lazy = true,
		cmd = { "Flog", "Flogsplit", "Floggit" },
	},
}
