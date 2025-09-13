return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  version = "*",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", opts = {} },
  },
  opts = {
    options = {
      mode = "buffers",
      always_show_bufferline = false,
      auto_toggle_bufferline = true,
    },
  },
  -- keys = {
  --   { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
  --   { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
  -- },
}
