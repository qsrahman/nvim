return {
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    build = ":MasonUpdate",
    keys = {
      { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" },
    },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
    },
    opts = {
      automatic_enable = false,
      ensure_installed = {
        -- "asm_lsp",
        "clangd",
        "cssls",
        "gopls",
        "html",
        "jsonls",
        "lua_ls",
        "neocmake",
        "pyright",
        "rust_analyzer",
        "taplo",
        "vtsls",
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "mason-org/mason.nvim",
    },
    opts = {
      auto_update = true,
      ensure_installed = {
        "black",
        "clang-format",
        "cmakelang",
        "cmakelint",
        { "eslint_d", version = "13.1.2" },
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",
        "isort",
        "prettier",
        "stylua",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "mason-org/mason.nvim",
    },
    opts = {
      automatic_installation = true,
      handlers = {
        python = function() end,
      },
      handler = {},
      ensure_installed = {
        "codelldb",
        "debugpy",
        -- "delve",
      },
    },
  },
}
