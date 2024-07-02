return {
	"LudoPinelli/comment-box.nvim",
	config = function()
		-- ── Named parts ─────────────────────────────────────────────────────

		-- Simple line

		-- ──────────────────────────────────────────────────────────────────────

		--                                                           ▲
		--   Marked comments                                         █
		--                                                           ▼

		-- Remove comment box or normal comment

		local wk = require("which-key")
		wk.register({
			C = {
				mode = { "n", "v" },
				silent = true, -- use `silent` when creating keymaps
				noremap = true, -- use `noremap` when creating keymaps
				name = " □  Boxes",
				b = { "<Cmd>CBccbox<CR>", "Box Title" },
				t = { "<Cmd>CBllline<CR>", "Titled Line" },
				l = { "<Cmd>CBline<CR>", "Simple Line" },
				m = { "<Cmd>CBllbox14<CR>", "Marked" },
				d = { "<Cmd>CBd<CR>", "Remove a box" },
			},
		}, { prefix = "<leader>" })
	end,
}
