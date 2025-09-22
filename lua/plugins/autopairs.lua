return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  opts = {
    check_ts = true, -- use treesitter to check for a pair
    ts_config = {
      lua = { "string" },
      javascript = { "template_string" },
      java = false,
    },
  },
}
