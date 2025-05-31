return {
	{ "Myzel394/easytables.nvim" },
    {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
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
}
