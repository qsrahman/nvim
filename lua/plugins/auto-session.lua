return {
  "rmagatti/auto-session",
  enabled = false,
  opts = {
    enabled = false,
    suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop" },
    -- session_lens = {
    --   picker = "fzf",
    -- },
  },
  keys = {
    { "<leader>qr", "<cmd>AutoSession restore<CR>", desc = "Restore session for cwd" },
    { "<leader>qs", "<cmd>AutoSession save<CR>", desc = "Save session for root dir" },
  },
}
