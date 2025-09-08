return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", opts = {} },
  },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local custom_theme = require("lualine.themes.dracula")
    custom_theme.normal.c.bg = "NONE"

    lualine.setup({
      options = {
        theme = custom_theme, -- "auto"
        always_show_tabline = false,
        globalstatus = vim.o.laststatus == 3,
        -- section_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        -- component_separators = { left = "|", right = "|" },
        component_separators = { left = "", right = "" },
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
          { "filetype", "lsp_status" },
        },
        lualine_y = { "location" },
        lualine_z = { "progress" },
      },
      extensions = { "lazy", "mason", "quickfix", "trouble", "nvim-dap-ui", "man" },
    })
  end,
}
