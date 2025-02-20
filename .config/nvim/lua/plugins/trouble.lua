return {
	"folke/trouble.nvim",
	keys = {
		{ "<leader>x", "", mode = "n", desc = "Trouble" },
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<cr>",
			mode = "n",
			desc = "[x] Diagnostics",
		},
		{
			"<leader>xX",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			mode = "n",
			desc = "[X] Buffer Diagnostics",
		},
		{
			"<leader>xl",
			"<cmd>Trouble loclist toggle<cr>",
			mode = "n",
			desc = "[L]ocation List",
		},
		{ "<leader>xt", "<cmd>Trouble todo<CR>", mode = "n", desc = "[t]odo" },
		{ "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", mode = "n", desc = "[s]ymbols" },
		{
			"<leader>xQ",
			"<cmd>Trouble qflist toggle<cr>",
			mode = "n",
			desc = "[Q]uickfix List",
		},
		{
			"<leader>xL",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			mode = "n",
			desc = "[L]SP Definitions / references / ...",
		},
	},

	requires = { "kyazdani42/nvim-web-devicons" }, -- Ensuring dependency is correctly specified

	config = function()
		require("trouble").setup({
			-- other configuration options
		})
		require("nvim-web-devicons").setup({
			default = true,
		})

		local icons = vim.g.diagnostic_icons
		local signs = {
			Error = icons.error,
			Warn = icons.warning,
			Hint = icons.info,
			Info = icons.hint,
		}

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end
	end,
}
