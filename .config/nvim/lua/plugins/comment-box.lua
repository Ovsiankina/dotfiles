return {
	"LudoPinelli/comment-box.nvim",
	config = function()
		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

--          ╭─────────────────────────────────────────────────────────╮
--          │                         Titles                          │
--          ╰─────────────────────────────────────────────────────────╯
		keymap({ "n", "v" }, "<Leader>cb", "<Cmd>CBccbox<CR>", opts)

-- ── Named parts ─────────────────────────────────────────────────────

		keymap({ "n", "v" }, "<Leader>ct", "<Cmd>CBllline<CR>", opts)
		-- Simple line

-- ──────────────────────────────────────────────────────────────────────
		keymap("n", "<Leader>cl", "<Cmd>CBline<CR>", opts)
		-- keymap("i", "<M-l>", "<Cmd>CBline<CR>", opts) -- To use in Insert Mode

--                                                           ▲
--   Marked comments                                         █
--                                                           ▼
		keymap({ "n", "v" }, "<Leader>cm", "<Cmd>CBllbox14<CR>", opts)

-- Remove comment box or normal comment
		keymap({ "n", "v" }, "<Leader>cd", "<Cmd>CBd<CR>", opts)

		local wk = require("which-key")

		wk.register({
			["<Leader>"] = {
				c = {
					name = " □  Boxes",
					b = { "<Cmd>CBccbox<CR>", "Box Title" },
					t = { "<Cmd>CBllline<CR>", "Titled Line" },
					l = { "<Cmd>CBline<CR>", "Simple Line" },
					m = { "<Cmd>CBllbox14<CR>", "Marked" },
					d = { "<Cmd>CBd<CR>", "Remove a box" },
				},
			},
		})
	end,
}
