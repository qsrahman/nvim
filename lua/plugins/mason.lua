return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    -- "jay-babu/mason-nvim-dap.nvim",
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
        "ts_ls",
      },
    })

    require("mason-tool-installer").setup({
      auto_update = true,
      ensure_installed = {
        "clang-format",
        -- "eslint_d",
        { "eslint_d", version = "13.1.2" },
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",
        "prettier",
        "stylua",
      },
    })

    -- require("mason-nvim-dap").setup({
    --   automatic_installation = true,
    --   handlers = {},
    --   handler = {},
    --   ensure_installed = {
    --     "codelldb",
    --     "debugpy",
    --     "delve",
    --   },
    -- })
  end,
}
