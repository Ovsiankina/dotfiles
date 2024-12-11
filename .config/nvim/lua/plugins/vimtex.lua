return {
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX

		init = function()

            vim.g.maplocalleader = "\\"

			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_compiler_method = "latexmk"
			vim.g.vimtex_view_general_viewer = "okular" -- Change to your viewer if needed
			vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex" -- PDF viewer options
		end,
	},
}
