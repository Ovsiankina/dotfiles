return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
    -- TODO: fhdsfjk
    --
    -- NOTE(df):

		keywords = {
			FIX = {
				icon = " ", -- icon used for the sign, and in search results
				color = "error", -- can be a hex color, or a named color (see below)
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "fixme", "bug", "fixit", "issue" },
			},
			TODO = {
				icon = " ",
				color = "info",
				alt = { "TODO", "CHORE", "TYPO", "todo", "chore", "typo" },
			},
			HACK = {
				icon = " ",
				color = "warning",
				alt = { "HACK", "hack" },
			},
			WARN = {
				icon = " ",
				color = "warning",
				alt = { "WARNING", "XXX", "warning", "xxx" },
			},
			PERF = {
				icon = " ",
				color = "default",
				alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "optim", "performance", "optimize" },
			},
			NOTE = {
				icon = " ",
				color = "hint",
				alt = {
					"INFO",
					"PRAISE",
					"NITPICK",
					"SUGGESTION",
					"QUESTION",
					"THOUGHT",
					"NOTE",
					"info",
					"praise",
					"nitpick",
					"suggestion",
					"question",
					"thought",
					"note",
				},
			},
			TEST = {
				icon = "⏲ ",
				color = "test",
				alt = { "TESTING", "PASSED", "FAILED", "testing", "passed", "failed" },
			},
		},

    highlight = {
        before = "", -- "fg" or "bg" or empty
        keyword = "bg", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
        after = "fg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*(\([^)]*\))?\s*:]], -- match keywords
        comments_only = true, -- uses treesitter to match keywords in comments only
        max_line_len = 400, -- ignore lines longer than this
    },

		colors = {
			error = { "#ed8796" },
			warning = { "#eed49f" },
			info = { "#8bd5ca" },
			hint = { "#a6da95" },
			default = { "#c6a0f6" },
			test = { "#f5bde6" },
		},
	},
}
