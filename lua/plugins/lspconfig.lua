return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
  },
  opts = {
    servers = {
      clangd = {},
      cssls = {},
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            analyses = {
              nilness = true,
              unusedparams = true,
              unusedwrite = true,
              useany = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = true,
          },
        },
      },
      html = {},
      jsonls = {},
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
    },
    inlay_hints = {
      enabled = false,
    },
    capabilities = {
      workspace = {
        fileOperations = {
          didRename = true,
          willRename = true,
        },
      },
    },
  },
  config = function(_, opts)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),

      callback = function(ev)
        local map = vim.keymap.set
        local options = { buffer = ev.buf, silent = true }

        options.desc = "Show LSP references"
        -- map("n", "gr", vim.lsp.buf.references, options)
        map("n", "gr", "<cmd>FzfLua lsp_references jump1=true ignore_current_line=true<cr>", options)

        options.desc = "Go to LSP definitions"
        -- map("n", "gd", vim.lsp.buf.definition, options)
        map("n", "gd", "<cmd>FzfLua lsp_definitions jump1=true ignore_current_line=true<cr>", options)

        options.desc = "Go to declaration"
        -- map("n", "gD", vim.lsp.buf.declaration, options)
        map("n", "gD", "<cmd>FzfLua lsp_declarations<cr>", options)

        options.desc = "Go to LSP type definitions"
        -- map("n", "gY", vim.lsp.buf.type_definition, options)
        map("n", "gy", "<cmd>FzfLua lsp_typedefs jump1=true ignore_current_line=true<cr>", options)

        options.desc = "Go to LSP implementations"
        -- map("n", "gI", vim.lsp.buf.implementation, options)
        map("n", "gI", "<cmd>FzfLua lsp_implementations jump1=true ignore_current_line=true<cr>", options)

        options.desc = "Show available code actions"
        -- map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, options)
        map({ "n", "v" }, "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>", options)

        options.desc = "Rename symbol"
        map("n", "<leader>cr", vim.lsp.buf.rename, options)

        -- options.desc = "List document symbols"
        -- map("n", "ss", vim.lsp.buf.document_symbol, options)

        -- options.desc = "List workspace symbols"
        -- map("n", "sS", vim.lsp.buf.workspace_symbol, options)

        options.desc = "Add workspace folder"
        map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, options)

        options.desc = "Remove workspace folder"
        map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, options)

        -- options.desc = "List workspace folders"
        -- map("n", "<leader>wl", function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, options)

        -- options.desc = "Show buffer diagnostics"
        -- map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", options)

        options.desc = "Show line diagnostics"
        map("n", "<leader>d", vim.diagnostic.open_float, options)

        options.desc = "Go to previous diagnostic"
        map("n", "[d", function()
          vim.diagnostic.jump({ count = -1 })
        end, options)

        options.desc = "Go to next diagnostic"
        map("n", "]d", function()
          vim.diagnostic.jump({ count = 1 })
        end, options)

        options.desc = "Show documentation for what is under cursor"
        map("n", "K", function()
          vim.lsp.buf.hover({ border = "rounded" })
        end, options)

        options.desc = "Show signature documentation"
        map("n", "gK", function()
          vim.lsp.buf.signature_help({ border = "rounded" })
        end, options)

        options.desc = "Show signature documentation"
        map("i", "<C-k>", function()
          vim.lsp.buf.signature_help({ border = "rounded" })
        end, options)

        options.desc = "Restart LSP"
        map("n", "<leader>rs", ":LspRestart<CR>", options)

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
          vim.lsp.inlay_hint.enable(opts.inlay_hints.enabled)
          options.desc = "Toggle inlay hints"
          map("n", "<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }))
          end, options)
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

    -- capabilities = vim.tbl_deep_extend("force", {}, opts.cpabilities, require("cmp_nvim_lsp").default_capabilities())
    opts.capabilities = vim.tbl_deep_extend("force", {}, opts.capabilities, require("blink.cmp").get_lsp_capabilities())

    vim.lsp.config("*", {
      capabilities = opts.capabilities,
      root_markers = { ".git" },
    })

    for server, cfg in pairs(opts.servers) do
      if not vim.tbl_isempty(cfg) then
        vim.lsp.config(server, cfg)
      end
      vim.lsp.enable(server)
    end
  end,
}
