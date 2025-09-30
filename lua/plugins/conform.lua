return {
  "stevearc/conform.nvim",
  -- enabled = false,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  init = function()
    vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
  end,
  opts = {
    formatters_by_ft = {
      c = { "clang-format" },
      cpp = { "clang-format" },
      css = { "prettier" },
      go = { "goimports", "gofumpt" },
      html = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      json = { "prettier" },
      lua = { "stylua" },
      markdown = { "prettier" },
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      yaml = { "prettier" },
    },
    formatters = {
      ["clang-format"] = {
        command = "clang-format",
        append_args = {
          "--style={ BasedOnStyle: Google, IndentWidth: 4, TabWidth: 4, ColumnLimit: 0, AccessModifierOffset: -4, DerivePointerAlignment: false, PointerAlignment: Left, Cpp11BracedListStyle: false}",
        },
      },
      stylua = {
        append_args = {
          "--indent-width",
          "2",
          "--indent-type",
          "Spaces",
          "--column-width",
          "120",
          "--line-endings",
          "Unix",
        },
      },
      prettier = {
        append_args = {
          "--arrow-parens",
          "always",
          "--tab-width",
          "2",
          "--use-tabs",
          "false",
          "--single-quote",
          "--semi",
          "false",
          "--print-width",
          "80",
          "--trailing-comma",
          "all",
          "--prose-wrap",
          "always",
          "--quote-props",
          "as-needed",
          "--html-whitespace-sensitivity",
          "css",
        },
      },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    },
  },
  keys = {
    {
      mode = { "n", "v" },
      "<leader>cF",
      function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end,
      desc = "Format file or range (in visual mode)",
    },
  },
}
