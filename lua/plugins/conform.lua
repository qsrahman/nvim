return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
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
      python = { "isort", "black" },
      -- rust = { "rustfmt" },
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
        },
      },
    },
    format_on_save = {
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
