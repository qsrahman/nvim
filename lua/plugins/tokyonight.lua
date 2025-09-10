return {
  "folke/tokyonight.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    local transparent = false

    -- if vim.g.neovide then
    --   transparent = false
    -- end

    require("tokyonight").setup({
      style = "storm",
      transparent = transparent,
      styles = {
        sidebars = transparent and "transparent" or "dark",
        floats = transparent and "transparent" or "dark",
      },
    })

    -- vim.cmd("colorscheme tokyonight")
  end,
}
