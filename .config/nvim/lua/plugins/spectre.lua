return {
	"nvim-pack/nvim-spectre",

	keys = {
		{
			"<leader><C-s>",
			'<cmd>lua require("spectre").toggle()<CR>',
			mode = "n",
			desc = "Toggle Spectre",
		},
		{
			"<leader><C-w>",
			'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
			mode = "n",
			desc = "Search on current file",
		},
	},
}
