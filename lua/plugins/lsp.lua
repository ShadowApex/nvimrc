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
