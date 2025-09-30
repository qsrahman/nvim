local M = {}

function M.setup(ev)
  local map = vim.keymap.set
  local opts = { buffer = ev.buf, silent = true }

  opts.desc = "Show LSP references"
  -- map("n", "gr", vim.lsp.buf.references, opts)
  map("n", "gr", "<cmd>FzfLua lsp_references jump1=true ignore_current_line=true<cr>", opts)

  opts.desc = "Goto LSP definitions"
  -- map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "gd", "<cmd>FzfLua lsp_definitions jump1=true ignore_current_line=true<cr>", opts)

  opts.desc = "Goto declaration"
  -- map("n", "gD", vim.lsp.buf.declaration, opts)
  map("n", "gD", "<cmd>FzfLua lsp_declarations<cr>", opts)

  opts.desc = "Goto LSP type definitions"
  -- map("n", "gY", vim.lsp.buf.type_definition, opts)
  map("n", "gy", "<cmd>FzfLua lsp_typedefs jump1=true ignore_current_line=true<cr>", opts)

  opts.desc = "Goto LSP implementations"
  -- map("n", "gI", vim.lsp.buf.implementation, opts)
  map("n", "gI", "<cmd>FzfLua lsp_implementations jump1=true ignore_current_line=true<cr>", opts)

  opts.desc = "Show available code actions"
  -- map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  map({ "n", "v" }, "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>", opts)

  opts.desc = "Rename symbol"
  map("n", "<leader>cr", vim.lsp.buf.rename, opts)

  -- opts.desc = "List document symbols"
  -- map("n", "ss", vim.lsp.buf.document_symbol, opts)

  -- opts.desc = "List workspace symbols"
  -- map("n", "sS", vim.lsp.buf.workspace_symbol, opts)

  opts.desc = "Add workspace folder"
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)

  opts.desc = "Remove workspace folder"
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)

  -- opts.desc = "List workspace folders"
  -- map("n", "<leader>wl", function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, opts)

  -- opts.desc = "Show buffer diagnostics"
  -- map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

  opts.desc = "Show line diagnostics"
  map("n", "<leader>d", vim.diagnostic.open_float, opts)

  opts.desc = "Goto previous diagnostic"
  map("n", "[d", function()
    vim.diagnostic.jump({ count = -1 })
  end, opts)

  opts.desc = "Goto next diagnostic"
  map("n", "]d", function()
    vim.diagnostic.jump({ count = 1 })
  end, opts)

  opts.desc = "Show documentation for what is under cursor"
  map("n", "K", function()
    vim.lsp.buf.hover({ border = "rounded" })
    -- vim.lsp.buf.hover()
  end, opts)

  opts.desc = "Show signature documentation"
  map("n", "gK", function()
    vim.lsp.buf.signature_help({ border = "rounded" })
    -- vim.lsp.buf.signature_help()
  end, opts)

  opts.desc = "Show signature documentation"
  map("i", "<C-k>", function()
    vim.lsp.buf.signature_help({ border = "rounded" })
    -- vim.lsp.buf.signature_help()
  end, opts)

  opts.desc = "Restart LSP"
  map("n", "<leader>rs", ":LspRestart<CR>", opts)
end

return M
