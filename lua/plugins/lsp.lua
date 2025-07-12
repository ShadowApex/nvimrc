return {
  -- add extra lanaguage servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gdscript = {
          mason = false,
        },
        dartls = {
          mason = false,
        },
        yamlls = {
          mason = false,
        },
        nil_ls = {
          mason = false,
          settings = {
            ["nil"] = {
              nixpkgs = {
                expr = "import <nixpkgs> { }",
              },
              formatting = {
                command = { "nixfmt" }, -- or alejandra or nixpkgs-fmt
              },
            },
          },
        },
        nixd = {
          mason = false,
          settings = {
            ["nixd"] = {
              nixpkgs = {
                expr = "import <nixpkgs> { }",
              },
              formatting = {
                command = { "nixfmt" }, -- or alejandra or nixpkgs-fmt
              },
            },
          },
        },
        csharp_ls = {
          mason = false,
        },
        zls = {
          mason = false,
        },
      },
    },
  },
  -- prevent rustaceanvim LSP conflict with mason (:h rustaceanvim.mason)
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
    },
  },
  -- rustaceanvim config
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        default_settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = {},
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
    },
  },
  -- add default language servers/linters
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "clang-format",
        "clangd",
        "cmake-language-server",
        "cmakelang",
        "codespell",
        "cpplint",
        "deno",
        "dockerfile-language-server",
        "eslint-lsp",
        "eslint_d",
        "flake8",
        "golangci-lint",
        "gopls",
        "jq",
        "json-lsp",
        "jsonlint",
        "jsonnet-language-server",
        "lua-language-server",
        "markdownlint",
        "marksman",
        "misspell",
        "nginx-language-server",
        "prettier",
        "pylint",
        "pyright",
        "python-lsp-server",
        "shellcheck",
        "shfmt",
        "sqlls",
        "stylua",
        "textlint",
        "typescript-language-server",
        "vim-language-server",
        "yaml-language-server",
        "yamlfmt",
        "yamllint",
      },
    },
  },
}
