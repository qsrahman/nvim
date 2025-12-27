local M = {
  diagnostics = {
    float = {
      border = "rounded",
      source = "if_many",
    },
    underline = true,
    update_in_insert = false,
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
    severity_sort = true,
    signs = {
      text = {
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.HINT] = "󰠠 ",
        [vim.diagnostic.severity.INFO] = " ",
        [vim.diagnostic.severity.ERROR] = " ",
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
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      },
      formatting = {
        dynamicRegistration = false,
      },
      semanticTokens = {
        augmentsSyntaxTokens = false,
      },
      completion = {
        completionItem = {
          contextSupport = true,
          snippetSupport = true,
          deprecatedSupport = true,
          preselectSupport = true,
          insertReplaceSupport = true,
          commitCharactersSupport = true,
          labelDetailsSupport = true,
          tagSupport = { valueSet = { 1 } },
          documentationFormat = { "markdown", "plaintext" },
          resolveSupport = {
            properties = {
              "documentation",
              "detail",
              "additionalTextEdits",
            },
          },
        },
      },
    },
    experimental = {
      hoverActions = true,
      hoverRange = true,
      serverStatusNotification = true,
      -- snippetTextEdit = true, -- not supported yet
      codeActionGroup = true,
      ssr = true,
      commands = {
        "rust-analyzer.runSingle",
        "rust-analyzer.debugSingle",
        "rust-analyzer.showReferences",
        "rust-analyzer.gotoLocation",
        "editor.action.triggerParameterHints",
      },
    },
  },
  servers = {
    -- asm_lsp = {},
    clangd = {
      keys = {
        { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
      },
      root_markers = {
        "compile_commands.json",
        "compile_flags.txt",
        "configure.ac", -- AutoTools
        "Makefile",
        "configure.ac",
        "configure.in",
        "config.h.in",
        "meson.build",
        "meson_options.txt",
        "build.ninja",
        ".git",
      },
      capabilities = {
        offsetEncoding = { "utf-16" },
      },
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
      },
      init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
      },
      InlayHints = {
        Enabled = true,
        Designators = true,
        ParameterNames = true,
        DeducedTypes = true,
      },
    },
    neocmake = {},
    cssls = {},
    -- gopls = {
    --   settings = {
    --     gopls = {
    --       gofumpt = true,
    --       codelenses = {
    --         gc_details = false,
    --         generate = true,
    --         regenerate_cgo = true,
    --         run_govulncheck = true,
    --         test = true,
    --         tidy = true,
    --         upgrade_dependency = true,
    --         vendor = true,
    --       },
    --       hints = {
    --         assignVariableTypes = true,
    --         compositeLiteralFields = true,
    --         compositeLiteralTypes = true,
    --         constantValues = true,
    --         functionTypeParameters = true,
    --         parameterNames = true,
    --         rangeVariableTypes = true,
    --       },
    --       analyses = {
    --         nilness = true,
    --         unusedparams = true,
    --         unusedwrite = true,
    --         useany = true,
    --       },
    --       usePlaceholders = true,
    --       completeUnimported = true,
    --       staticcheck = true,
    --       directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
    --       semanticTokens = true,
    --     },
    --   },
    -- },
    html = {},
    jsonls = {
      settings = {
        json = {
          format = {
            enable = true,
          },
          validate = { enable = true },
        },
      },
    },
    lua_ls = {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
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
        python = {
          analysis = {
            typeCheckingMode = "basic", -- Can be "off", "basic", "standard", or "strict"
            autoImportCompletion = true,
            diagnosticSeverityOverrides = {
              reportWildcardImportFromLibrary = "none",
            },
          },
        },
      },
    },
    -- pyright = {
    --   settings = {
    --     pyright = {
    --       -- Using Ruff's import organizer
    --       disableOrganizeImports = true,
    --     },
    --     python = {
    --       analysis = {
    --         -- Ignore all files for analysis to exclusively use Ruff for linting
    --         ignore = { "*" },
    --         typeCheckingMode = "off",
    --       },
    --     },
    --   },
    -- },
    -- ruff = {
    --   init_options = {
    --     settings = {
    --       args = {},
    --       logLevel = "error",
    --       lint = {
    --         ignore = { "F403", "F405" },
    --       },
    --     },
    --   },
    --   on_attach = function(client, _)
    --     -- Disable hover in favor of Pyright
    --     client.server_capabilities.hoverProvider = false
    --   end,
    -- },
    rust_analyzer = {
      inlayHints = {
        bindingModeHints = {
          enable = false,
        },
        chainingHints = {
          enable = true,
        },
        closingBraceHints = {
          enable = true,
          minLines = 25,
        },
        closureReturnTypeHints = {
          enable = "never",
        },
        lifetimeElisionHints = {
          enable = "never",
          useParameterNames = false,
        },
        maxLength = 25,
        parameterHints = {
          enable = true,
        },
        reborrowHints = {
          enable = "never",
        },
        renderColons = true,
        typeHints = {
          enable = true,
          hideClosureInitialization = false,
          hideNamedConstructor = false,
        },
      },
    },
    vtsls = {
      -- explicitly add default filetypes, so that we can extend
      -- them in related extras
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      settings = {
        complete_function_calls = true,
        vtsls = {
          enableMoveToFileCodeAction = true,
          autoUseWorkspaceTsdk = true,
          experimental = {
            maxInlayHintLength = 30,
            completion = {
              enableServerSideFuzzyMatch = true,
            },
          },
        },
        typescript = {
          updateImportsOnFileMove = { enabled = "always" },
          suggest = {
            completeFunctionCalls = true,
          },
          inlayHints = {
            enumMemberValues = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            parameterNames = { enabled = "literals" },
            parameterTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            variableTypes = { enabled = false },
          },
        },
      },
      keys = {},
    },
  },
}

return M
