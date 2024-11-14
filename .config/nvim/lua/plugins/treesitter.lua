return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
    opts = {
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"elixir",
				"heex",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"python",
				"php",
				"java",
			},
			additional_vim_regex_highlighting = false,
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
    },
}
