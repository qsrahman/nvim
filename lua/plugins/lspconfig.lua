return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
  },
  config = function()
    local opts = require("config.lsp-options")

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(ev)
        require("config.lsp-keymaps").setup(ev)

        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then
          return
        end

        if client:supports_method("textDocument/semanticTokens") then
          client.server_capabilities.semanticTokensProvider = nil
        end

        -- Format the current buffer on save
        -- vim.api.nvim_create_autocmd("BufWritePre", {
        --   buffer = ev.buf,
        --   callback = function()
        --     vim.lsp.buf.format({
        --       bufnr = ev.buf,
        --       id = client.id,
        --       async = false,
        --       timeout_ms = 1000,
        --     })
        --   end,
        -- })

        if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = ev.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = ev.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
            end,
          })
        end

        if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          vim.lsp.inlay_hint.enable(opts.inlay_hints.enabled)
          vim.keymap.set("n", "<leader>uh", function()
            vim.lsp.inlay_hint.elseifnable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }))
          end, { desc = "Toggle inlay hints", buffer = ev.buf, silent = true })
        end
      end,
    })
    local capabilities =
      vim.tbl_deep_extend("force", {}, opts.capabilities, require("blink.cmp").get_lsp_capabilities())

    vim.lsp.config("*", {
      capabilities = capabilities,
      root_markers = { ".git" },
    })

    for server, cfg in pairs(opts.servers) do
      if not vim.tbl_isempty(cfg) then
        vim.lsp.config(server, cfg)
      end
      vim.lsp.enable(server)
    end

    vim.diagnostic.config(opts.diagnostics)
  end,
}
