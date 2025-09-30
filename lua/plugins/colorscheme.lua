return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      style = "moon",
    },
    -- init = function()
    --   vim.cmd("colorscheme tokyonight")
    -- end,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    priority = 1000,
    name = "catppuccin",
    init = function()
      vim.cmd.colorscheme("catppuccin-macchiato")
    end,
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      background = {
        light = "latte",
        dark = "macchiato",
      },
      transparent_background = false,
      float = {
        transparent = false,
        solid = false,
      },
      lsp_styles = {
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      integrations = {
        alpha = true,
        blink = true,
        fzf = true,
        lsp_trouble = true,
        mason = true,
        nvimtree = true,
        -- noice = true,
        notify = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },
}
