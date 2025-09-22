return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", opts = {} },
  },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    -- local custom_theme = require("lualine.themes.dracula")
    -- custom_theme.normal.c.bg = "#24273a"

    lualine.setup({
      options = {
        theme = "dracula", -- "auto"
        always_show_tabline = false,
        section_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "|", right = "|" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "alpha" },
        },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(s)
              return " " .. s
            end,
          },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64" },
          },
          { "lsp_status", color = { fg = "#00ee00" }, icon = { "󱐋", color = { fg = "gold" } } },
          -- { "filetype" },
        },
        lualine_y = { "location" },
        lualine_z = { "progress" },
      },
      extensions = { "lazy", "nvim-tree", "mason", "quickfix", "trouble", "nvim-dap-ui", "man", "fzf" },
    })
  end,
}
