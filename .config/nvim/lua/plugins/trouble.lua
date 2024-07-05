return {
	"folke/trouble.nvim",
	requires = { "kyazdani42/nvim-web-devicons" }, -- Ensuring dependency is correctly specified
	config = function()
		require("trouble").setup({
			-- other configuration options
		})
		require("nvim-web-devicons").setup({
			default = true,
		})

		local signs = {
			Error = "", -- icon for errors
			Warn = "", -- icon for warnings
			Hint = "", -- icon for hints
			Info = "" , -- icon for information
		}

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local wk = require("which-key")
		wk.register({
			["<leader>x"] = {
				name = "Trouble",
				silent = true,
				noremap = true,
				["x"] = { mode = "n", "<cmd>Trouble diagnostics toggle<cr>", "[x]Diagnostics" },
				["X"] = { mode = "n", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "[X]Buffer Diagnostics" },
				["l"] = { mode = "n", "<cmd>Trouble loclist toggle<cr>", "[L]ocation List" },
				["t"] = { mode = "n", "<cmd>Trouble todo<CR>", "[t]odo" },
				["s"] = { mode = "n", "<cmd>Trouble symbols toggle focus=false<cr>", "[s]ymbols" },
				["Q"] = { mode = "n", "<cmd>Trouble qflist toggle<cr>", "[Q]uickfix List" },
				["L"] = {
					mode = "n",
					"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
					"[L]SP Definitions / references / ...",
				},
			},
		})
	end,
}
