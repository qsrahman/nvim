return {
  "catppuccin/nvim",
  enabled = true,
  name = "catppuccin",
  lazy = false,
  priority = 1000,
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
    -- default_integrations = true,
    integrations = {
      fzf = true,
      lsp_trouble = false,
      mason = false,
      nvim_surround = false,
      dap = true,
      dap_ui = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
          ok = { "underline" },
          inlay_hints = {
            background = true,
          },
        },
      },
      nvimtree = true,
      semantic_tokens = true,
      treesitter = true,
      treesitter_context = true,
      which_key = false,
      blink_cmp = {
        style = "bordered",
      },
    },
  },
  specs = {
    {
      "akinsho/bufferline.nvim",
      opts = function(_, opts)
        if (vim.g.colors_name or ""):find("catppuccin") then
          opts.highlights = require("catppuccin.groups.integrations.bufferline").get_theme()
        end
      end,
    },
  },
}
