return {
	{ "Myzel394/easytables.nvim" },
    {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		keys = {
			{ "<leader>m", group = "Markdown" },
			{ "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", mode = "n", desc = "Markdown [p]review" },
		},
	},
}
