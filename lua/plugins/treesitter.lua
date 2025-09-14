return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "diff",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "json5",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "ninja",
        "norg",
        "python",
        "query",
        "regex",
        "ron",
        "rst",
        "rust",
        "scss",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "toml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<C-Bs>",
        },
      },
    })

    -- use bash parser for zsh files
    vim.treesitter.language.register("bash", "zsh")
  end,
}
