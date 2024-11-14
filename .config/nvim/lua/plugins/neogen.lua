return {
	"danymat/neogen",
	opts = {
		languages = {
			c = {
				template = {
					annotation_convention = "xmldoc", -- for a full list of annotation_conventions, see supported-languages below,
				},
			},
		},
	},
	keys = {
		{
			"<leader>n",
			"",
			mode = "n",
			desc = "Annotation generation",
		},
		{
			"<leader>nf",
			":lua require('neogen').generate()<CR>",
			mode = "n",
			desc = "Generate annotation for [f]unctions",
		},
		{
			"<leader>nc",
			":lua require('neogen').generate({ type = 'class' })<CR>",
			mode = "n",
			desc = "Generate annotation for [c]lasses",
		},
		{
			"<leader>nt",
			":lua require('neogen').generate({ type = 'type' })<CR>",
			mode = "n",
			desc = "Generate annotation for [t]ypes",
		},
		{
			"<leader>nF",
			":lua require('neogen').generate({ type = 'file' })<CR>",
			mode = "n",
			desc = "Generate annotation for [F]ile",
		},
	},
}
-- TODO: add cs xml annotation
