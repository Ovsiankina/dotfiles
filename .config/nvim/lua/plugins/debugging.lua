return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "mfussenegger/nvim-dap-python", -- Add this dependency for Python support
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        local dap_python = require("dap-python")

        -- Setup dap-ui
        require("dapui").setup()

        -- Setup dap-python
        dap_python.setup("python") -- Specify the Python executable, e.g., "python3" or a specific path

        -- Add configuration for Python
        dap_python.test_runner = "pytest" -- Optional: set test runner to pytest

        -- Example configuration for gdb (C, C++, Rust)
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
        }
        -- Reuse these configurations for C and Rust
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp

        -- Automatically open dap-ui when debugging starts
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        -- Automatically close dap-ui when debugging ends
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- Define key mappings inside the config block
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
        vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
        vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
        vim.keymap.set("n", "<leader>ds", dap.terminate, { desc = "Stop debugging" })
        vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run last configuration" })
    end,
}
