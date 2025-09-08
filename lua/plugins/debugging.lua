return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    { "leoluz/nvim-dap-go", opts = {} },
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("dap-python").setup("python3")

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
