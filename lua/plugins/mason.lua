return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  keys = {
    { "<leader>cm", "<cmd>Mason<cr>", desc = "Open Mason" },
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      automatic_enable = false,
      ensure_installed = {
        "clangd",
        "cssls",
        "gopls",
        "html",
        "jsonls",
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "ts_ls",
      },
    })

    require("mason-tool-installer").setup({
      auto_update = true,
      integration = {
        ["mason-lspconfig"] = true,
        ["mason-nvim-dap"] = true,
      },
      ensure_installed = {
        "black",
        "clang-format",
        "eslint_d",
        "goimports",
        "gofumpt",
        "isort",
        "prettier",
        "pylint",
        "stylua",
      },
    })

    require("mason-nvim-dap").setup({
      -- automatic_installation = true,
      handler = {},
      ensure_installed = {
        "codelldb",
        "debugpy",
        "delve",
      },
    })
  end,
}
