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
		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "-i", "dap" },
		}
		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
		} -- Reuse these configurations for C and Rust
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

		--          ╭─────────────────────────────────────────────────────────╮
		--          │                          Remap                          │
		--          ╰─────────────────────────────────────────────────────────╯
		local wk = require("which-key")
		wk.register({
			["<leader>d"] = {
				name = "Debugger",
				["b"] = { mode = "n", dap.toggle_breakpoint, "Toggle breakpoint" },
				["c"] = { mode = "n", dap.continue, "Continue" },
			},
		})
	end,
}
