local icons = vim.g.diagnostic_icons

return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		keywords = {
            -- FIX:
			ERROR = {
				icon = icons.bug,
				color = "error",
				alt = {
					"FIX",
					"FIXME",
					"BUG",
					"FIXIT",
					"ISSUE",
					"fix",
					"fixme",
					"bug",
					"fixit",
					"issue",
				},
			},
            -- TODO:
			TODO = {
				icon = icons.hint,
				color = "info",
				alt = {
					"TODO",
					"CHORE",
					"TYPO",
					"todo",
					"chore",
					"typo",
				},
			},
            -- HACK:
			HACK = {
				icon = icons.hack,
				color = "warning",
				alt = {
					"HACK",
					"hack",
				},
			},
            -- WARN:
			WARN = {
				icon = icons.warning,
				color = "warning",
				alt = {
					"WARNING",
					"warning",
				},
			},
            -- PERF:
			PERF = {
				icon = icons.perf,
				color = "default",
				alt = {
					"OPTIM",
					"PERFORMANCE",
					"OPTIMIZE",
					"optim",
					"performance",
					"optimize",
				},
			},
            -- NOTE:
			NOTE = {
				icon = icons.note,
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
            -- TEST:
			TEST = {
				icon = icons.test,
				color = "test",
				alt = {
					"TEST",
					"TESTING",
					"PASSED",
					"FAILED",
					"test",
					"testing",
					"passed",
					"failed",
				},
			},
		},

		-- TODO:
        --
		-- NOTE(exemple): exemple
		--
		-- BUG(exemple): exemple
		-- test

		--@WARN: exemple
		-- test

		--@TEST: exemple
		-- test
		merge_keywords = true, -- when true, custom keywords will be merged with the defaults

		highlight = {
			pattern = [[.*<(%(KEYWORDS)%(\(.{-1,}\))?):]],
		},

		search = {
			-- regex that will be used to match keywords.
			-- don't replace the (KEYWORDS) placeholder
			pattern = [[\b(KEYWORDS)\b\s*(\([^)]*\))?\s*:]], -- ripgrep regex
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
	config = function(_, opts)
		require("todo-comments").setup(opts)
		-- Override the keywords table metatable so that if a match
		-- returns extra characters (e.g. "TODO 2" or "NOTE(foo)"), only the
		-- base keyword (the initial word) is used to look up highlighting info.
		local cfg = require("todo-comments.config")
		setmetatable(cfg.keywords, {
			__index = function(t, k)
				local base = vim.fn.matchstr(k, [[^\w\+]])
				if base == "" then
					return nil
				else
					return rawget(t, base)
				end
			end,
		})
	end,
}
