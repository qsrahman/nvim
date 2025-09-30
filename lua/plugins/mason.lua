return {
  "mason-org/mason.nvim",
  cmd = { "Mason", "MasonInstall", "MasonUpdate" },
  dependencies = {
    "jay-babu/mason-nvim-dap.nvim",
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  build = ":MasonUpdate",
  keys = {
    { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
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
        "ruff",
        "rust_analyzer",
        "taplo",
        "vtsls",
      },
    })

    require("mason-tool-installer").setup({
      auto_update = true,
      ensure_installed = {
        "clang-format",
        "eslint_d",
        -- { "eslint_d", version = "13.1.2" },
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",
        "prettier",
        "stylua",
      },
    })

    require("mason-nvim-dap").setup({
      automatic_installation = true,
      handlers = {
        python = function() end,
      },
      handler = {},
      ensure_installed = {
        "codelldb",
        "debugpy",
        "delve",
      },
    })
  end,
}
