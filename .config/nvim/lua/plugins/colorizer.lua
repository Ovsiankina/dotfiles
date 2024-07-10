return {
	"brenoprata10/nvim-highlight-colors",
	config = function()
		require("nvim-highlight-colors").setup({
			render = "foreground", -- or 'foreground' or 'first_column'
			enable_named_colors = true,
			enable_tailwind = true,

			custom_colors = {
				-- { label = "%-%-theme%-primary%-color",   color = "#0f1219" },
				-- { label = "%-%-theme%-secondary%-color", color = "#5a5d64" },
				-- { label = 'rosewater', color = '#f4dbd6' },
				{ label = "cat-flamingo", color = "#f0c6c6" },
				{ label = "cat-pink", color = "#f5bde6" },
				{ label = "cat-mauve", color = "#c6a0f6" },
				{ label = "cat-red", color = "#ed8796" },
				{ label = "cat-maroon", color = "#ee99a0" },
				{ label = "cat-peach", color = "#f5a97f" },
				{ label = "cat-yellow", color = "#eed49f" },
				{ label = "cat-green", color = "#a6da95" },
				{ label = "cat-teal", color = "#8bd5ca" },
				{ label = "cat-sky", color = "#91d7e3" },
				{ label = "cat-sapphire", color = "#7dc4e4" },
				{ label = "cat-blue", color = "#8aadf4" },
				{ label = "cat-lavender", color = "#b7bdf8" },
				{ label = "cat-text", color = "#cad3f5" },
				{ label = "cat-subtext1", color = "#b8c0e0" },
				{ label = "cat-subtext0", color = "#a5adcb" },
				{ label = "cat-overlay2", color = "#939ab7" },
				{ label = "cat-overlay1", color = "#8087a2" },
				{ label = "cat-overlay0", color = "#6e738d" },
				{ label = "cat-surface2", color = "#5b6078" },
				{ label = "cat-surface1", color = "#494d64" },
				{ label = "cat-surface0", color = "#363a4f" },
				{ label = "cat-base", color = "#24273a" },
				{ label = "cat-mantle", color = "#1e2030" },
				{ label = "cat-crust", color = "#181926" },
			},
			color = "--theme-secondary-color",
		})

		require("cmp").setup({
			formatting = {
				format = function(entry, item)
					local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
					item = require("lspkind").cmp_format({
						-- any lspkind format settings here
					})(entry, item)
					if color_item.abbr_hl_group then
						item.kind_hl_group = color_item.abbr_hl_group
						item.kind = color_item.abbr
					end
					return item
				end,
			},
		})
	end,
}
