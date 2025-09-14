return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", opts = {} },
  },
  opts = {
    view = {
      width = 30,
    },
    -- disable window_picker for explorer to work well with window splits
    actions = {
      open_file = {
        quit_on_open = true,
        window_picker = {
          enable = false,
        },
      },
    },
    filters = {
      dotfiles = true,
      custom = { ".git", ".DS_Store", "__pycache__", "node_modules" },
    },
    git = {
      ignore = false,
    },
  },
  keys = {
    { "<leader>fe", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
    { "<leader>fE", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle file explorer on current file" },
    -- { "<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse file explorer" },
    -- { "<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh file explorer" },
    { "\\", "<cmd>NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
    -- { "<C-b>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
    -- { "<C-b>", "<C-o><cmd>NvimTreeToggle<CR>", desc = "Toggle File Explorer", mode = { "i" } },
  },
}
