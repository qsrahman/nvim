return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
    "nvim-lua/plenary.nvim",
    -- "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),

      callback = function(ev)
        local map = vim.keymap.set
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Show LSP references"
        -- map("n", "gr", vim.lsp.buf.references, opts)
        map("n", "gr", "<cmd>FzfLua lsp_references jump1=true ignore_current_line=true<cr>", opts)

        opts.desc = "Go to LSP definitions"
        -- map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "gd", "<cmd>FzfLua lsp_definitions jump1=true ignore_current_line=true<cr>", opts)

        opts.desc = "Go to declaration"
        -- map("n", "gD", vim.lsp.buf.declaration, opts)
        map("n", "gD", "<cmd>FzfLua lsp_declarations<cr>", opts)

        opts.desc = "Go to LSP type definitions"
        -- map("n", "gY", vim.lsp.buf.type_definition, opts)
        map("n", "gy", "<cmd>FzfLua lsp_typedefs jump1=true ignore_current_line=true<cr>", opts)

        opts.desc = "Go to LSP implementations"
        -- map("n", "gI", vim.lsp.buf.implementation, opts)
        map("n", "gI", "<cmd>FzfLua lsp_implementations jump1=true ignore_current_line=true<cr>", opts)

        opts.desc = "Show available code actions"
        -- map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        map({ "n", "v" }, "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>", opts)

        opts.desc = "Rename symbol"
        map("n", "<leader>cr", vim.lsp.buf.rename, opts)

        -- opts.desc = "Show buffer diagnostics"
        -- map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        map("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        map("n", "[d", function()
          vim.diagnostic.jump({ count = -1 })
        end, opts)

        opts.desc = "Go to next diagnostic"
        map("n", "]d", function()
          vim.diagnostic.jump({ count = 1 })
        end, opts)

        opts.desc = "Show documentation for what is under cursor"
        map("n", "K", function()
          vim.lsp.buf.hover({ border = "rounded" })
        end, opts)

        opts.desc = "Show signature documentation"
        map("n", "gK", function()
          vim.lsp.buf.signature_help({ border = "rounded" })
        end, opts)

        opts.desc = "Show signature documentation"
        map("i", "<C-k>", function()
          vim.lsp.buf.signature_help({ border = "rounded" })
        end, opts)

        opts.desc = "Restart LSP"
        map("n", "<leader>rs", ":LspRestart<CR>", opts)

        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then
          return
        end

        -- Format the current buffer on save
        -- vim.api.nvim_create_autocmd("BufWritePre", {
        --   buffer = ev.buf,
        --   callback = function()
        --     vim.lsp.buf.format({ bufnr = ev.buf, id = client.id })
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
          -- vim.lsp.inlay_hint.enable(true)
          opts.desc = "Toggle inlay hints"
          map("n", "<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }))
          end, opts)
        end
      end,
    })

    vim.diagnostic.config({
      float = {
        border = "rounded",
        source = "if_many",
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = "󰠠 ",
          [vim.diagnostic.severity.INFO] = " ",
          [vim.diagnostic.severity.ERROR] = " ",
        },
      },
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    })

    local servers = {
      clangd = {},
      cssls = {},
      jsonls = {},
      gopls = {},
      html = {},
      lua_ls = {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
            diagnostics = {
              globals = { "vim" },
              disable = { "missing-fields" },
            },
            completion = {
              callSnippet = "Replace",
            },
            runtime = { version = "LuaJIT" },
            doc = {
              privateName = { "^_" },
            },
            hint = {
              enable = true,
              setType = false,
              paramType = true,
              paramName = "Disable",
              semicolon = "Disable",
              arrayIndex = "Disable",
            },
          },
        },
      },
      pyright = {
        settings = {
          -- pyright = {},
          python = {
            analysis = {
              typeCheckingMode = "basic", -- Can be "off", "standard", or "strict"
              autoSearchPaths = true,
              diagnosticMode = "openFilesOnly",
              autoImportCompletion = true,
              useLibraryCodeForTypes = true,
              diagnosticSeverityOverrides = {
                reportUnusedVariable = "warning",
                reportMissingImports = "error",
              },
            },
            pythonPath = vim.fn.exepath("python3"),
            venvPath = ".venv",
          },
        },
      },
      rust_analyzer = {},
      ts_ls = {
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      },
    }

    local capabilities = {
      workspace = {
        fileOperations = {
          didRename = true,
          willRename = true,
        },
      },
    }
    -- capabilities = vim.tbl_deep_extend("force", {}, capabilities, require("cmp_nvim_lsp").default_capabilities())
    capabilities = vim.tbl_deep_extend("force", {}, capabilities, require("blink.cmp").get_lsp_capabilities())

    vim.lsp.config("*", {
      capabilities = capabilities,
      root_markers = { ".git" },
    })

    for server, cfg in pairs(servers) do
      if not vim.tbl_isempty(cfg) then
        vim.lsp.config(server, cfg)
      end
      vim.lsp.enable(server)
    end
  end,
}
