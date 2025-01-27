return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	opts = function()
		local u = require("catppuccin.utils.colors")
		return {
			background = { -- :h background
				light = "latte",
				dark = "macchiato",
			},
			transparent_background = false, -- disables setting the background color.
			custom_highlights = function(colors)
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
			default_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		}
	end,

	-- Directly set the colorscheme after the plugin is loaded
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd("colorscheme catppuccin")  -- This directly applies the colorscheme after setup
	end,

	-- Keybinding for toggling background
	keys = {
		{
			"<leader>l",
			function()
				if vim.o.bg == "dark" then
					vim.o.bg = "light"
				else
					vim.o.bg = "dark"
				end
				vim.cmd("colorscheme catppuccin")  -- Refresh the colorscheme after toggling
			end,
			desc = "Toggle [l]ight mode",
		},
	},
}
