return {
  "saghen/blink.cmp",
  event = "VimEnter",
  version = "1.*",
  -- build = "cargo build --release",
  dependencies = {
    "folke/lazydev.nvim",
    "rafamadriz/friendly-snippets",
    {
      "saghen/blink.compat",
      version = "*",
      lazy = true,
      opts = {},
    },
  },
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      preset = "enter",
      ["<C-y>"] = { "select_and_accept" },
    },
    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
    },
    completion = {
      accept = {
        -- experimental auto-brackets support
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        draw = {
          treesitter = { "lsp" },
        },
        scrollbar = false,
        border = "rounded",
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          scrollbar = false,
          border = "rounded",
        },
      },
      ghost_text = {
        enabled = true,
      },
    },
    sources = {
      default = { "lsp", "snippets", "path", "buffer", "lazydev" },
      providers = {
        lazydev = {
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },
    cmdline = {
      enabled = false,
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
    signature = {
      enabled = true,
      window = {
        scrollbar = false,
        border = "rounded",
      },
    },
  },
  opts_extend = {
    "sources.completion.enabled_providers",
    "sources.compat",
    "sources.default",
  },
}
