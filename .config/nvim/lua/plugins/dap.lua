return {
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require "dap"
            local dapui = require "dapui"
            dapui.setup()
            -- dap.listeners.after.event_initialized["dapui_config"] = function()
            --   dapui.open()
            -- end
            -- dap.listeners.before.event_terminated["dapui_config"] = function()
            --   dapui.close()
            -- end
            -- dap.listeners.before.event_exited["dapui_config"] = function()
            -- dapui.close()
            --end
        end,
    },
    {
        "mfussenegger/nvim-dap",
        config = function()
            local home = os.getenv "HOME"
            local dap = require "dap"
            dap.adapters.codelldb = {
                type = "server",
                port = "5678",
                executable = {
                    command = home .. "/.local/share/nvim/mason/bin/codelldb",
                    args = { "--port", "5678" },
                },
                detached = false,
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
            dap.configurations.c = dap.configurations.cpp
        end,
    },
}
