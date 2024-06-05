return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function() -- This automatically calls 'require'
		require("catppuccin").setup({

			background = { -- :h background
				light = "latte",
				dark = "macchiato",
			},
			transparent_background = false, -- disables setting the background color.
			custom_highlights = function(colors)
				local u = require("catppuccin.utils.colors")
				return {
					CursorLine = {
						bg = u.vary_color(
							{ latte = u.lighten(colors.mantle, 0.70, colors.base) },
							u.darken(colors.surface0, 0.64, colors.base)
						),
					},
				}
			end,
			dim_inactive = {
				enabled = true, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			color_overrides = {},
			default_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		})
		vim.cmd.colorscheme("catppuccin")
		----- Remap -----
		-- Change the to dark or light (macchiato/latte)
		function ToggleBackground()
			if vim.o.bg == "dark" then
				vim.o.bg = "light"
			else
				vim.o.bg = "dark"
			end
			vim.cmd("colorscheme catppuccin")
		end

		vim.api.nvim_set_keymap("n", "<leader>l", ":lua ToggleBackground()<CR>", { noremap = true, silent = true })
	end,
}
