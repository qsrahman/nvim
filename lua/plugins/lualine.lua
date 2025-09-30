return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", opts = {} },
  opts = {
    options = {
      theme = "dracula",
      globalstatus = vim.o.laststatus == 3,
      section_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
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
      lualine_c = {},
      lualine_x = {
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = { fg = "#ff9e64" },
        },
        { "lsp_status", color = { fg = "#00dd00" }, icon = { "󱐋", color = { fg = "gold" } } },
      },
      lualine_y = { "location" },
      lualine_z = { "progress" },
    },
    tabline = {
      lualine_a = {
        {
          "buffers",
          symbols = {
            alternate_file = "",
          },
        },
      },
      lualine_z = { "tabs" },
    },
    extensions = { "lazy", "nvim-tree", "mason", "quickfix", "trouble", "nvim-dap-ui", "man", "fzf" },
  },
}
