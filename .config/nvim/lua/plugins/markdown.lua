return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@type render.md.UserConfig
		opts = {},
		-- require("render-markdown").setup({
		-- 	completions = { blink = { enabled = true } },
		-- }),
	},
	{ "Myzel394/easytables.nvim" },
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		config = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.g.mkdp_browser = "zen-browser"
		end,
		ft = { "markdown" },
		keys = {
			{ "<leader>m", group = "Markdown" },
			{ "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", mode = "n", desc = "Markdown [p]review" },
		},
	},
	{
		"3rd/image.nvim",
		build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
		opts = {
			processor = "magick_cli",
			editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
			tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)

			integrations = {
				markdown = {
					enabled = true,
					clear_in_insert_mode = true,
					download_remote_images = true,
					only_render_image_at_cursor = false,
					only_render_image_at_cursor_mode = "popup",
					floating_windows = false, -- if true, images will be rendered in floating markdown windows
					filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
				},
			},
		},
	},
}
