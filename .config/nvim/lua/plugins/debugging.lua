return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		require("dapui").setup()
		-- Exemple with DAP for GO language
		-- require("dap-go").setup()
		dap.adapters.codelldb = {
			-- type = 'server',
			-- host = '127.0.0.1',
			-- port = 13000, -- 💀 Use the port printed out or specified with `--port`
			type = "server",
			port = "${port}",
			executable = {
				-- CHANGE THIS to your path!
				command = "/usr/lib/codelldb/adapter/codelldb",
				-- command = "/absolute/path/to/codelldb/extension/adapter/codelldb",
				args = { "--port", "${port}" },

				-- On windows you may have to uncomment this:
				-- detached = false,
			},
		}
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}
    -- Reuse these configurations for C and Rust
		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
		-- db: Debugging breakpoint
		vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
		-- dc: Debugging continue
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})
	end,
}
