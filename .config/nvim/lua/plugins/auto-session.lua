return {
	{
		"rmagatti/auto-session",
		dependencies = {
			"nvim-telescope/telescope.nvim", -- Only needed if you want to use sesssion lens
		},
		config = function()
			require("auto-session").setup({
				auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
			})
		end,
	},
  {"rmagatti/session-lens"},
   dependencies = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
}
