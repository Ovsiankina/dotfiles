return {
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX

		-- NOTE: if doesn't work: try `$ fmtutil-sys --all`
		-- `$ sudo texconfig rehash`
		-- `$ sudo pacman -S extra/texlive-latex extra/texlive-latexextra extra/texlive-plaingeneric zathura-pdf-mupdf`

		init = function()
			vim.g.maplocalleader = "\\"

            vim.g.vimtex_compiler_latexmk_options = "-pdf -quiet"

			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_compiler_method = "latexmk"
			vim.g.vimtex_view_general_viewer = "zathura" -- Change to your viewer if needed
			vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex" -- PDF viewer options
		end,
	},
}
