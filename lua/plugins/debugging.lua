return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    { "leoluz/nvim-dap-go", opts = {} },
    "mxsdev/nvim-dap-vscode-js",
    {
      "microsoft/vscode-js-debug",
      opt = true,
      run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
    },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("dap-python").setup("python3")

    require("dap-vscode-js").setup({
      -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
      debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug", -- Path to vscode-js-debug installation.
      -- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
      adapters = { "chrome", "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
      -- log_file_path = vim.fn.stdpath('data') .. "/lazy/vscode-js-debug/" .. "src/dap_vscode_js.log" -- Path for file logging
      -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
      -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
    })

    dapui.setup({})

    -- Automatically open/close DAP UI
    -- dap.listeners.after.event_initialized["dapui_config"] = function()
    --   dapui.open()
    -- end

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

    vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Debug continue" })
    vim.keymap.set("n", "<Leader>do", dap.step_over, { desc = "Debug step over" })
    vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "Debug step into" })
    vim.keymap.set("n", "<Leader>dO", dap.step_out, { desc = "Debug step out" })
    vim.keymap.set("n", "<Leader>dq", dap.terminate, { desc = "Debug terminate" })
    vim.keymap.set("n", "<Leader>du", dapui.toggle, { desc = "Toggle debug UI" })
  end,
}
