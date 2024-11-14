return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "nil",
        "html-lsp",
        "prisma-language-server",
        "typescript-language-server",
        "tailwindcss-language-server",
        "css-lsp",
        "luacheck",
        "stylua",
        "shellcheck",
        "shfmt",
        "gopls",
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Automatically setup LSP servers installed via mason-lspconfig
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              hint = { enable = true, paramName = "All" },
            },
          },
        },
        gopls = {
          settings = {
            gopls = {
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
                unusedparams = true, -- Detect unused function parameters
                unusedwrite = true, -- Detect unused writes
              },
              staticcheck = true, -- Enable staticcheck (advanced linting)
            },
          },
        },
      },
    },
  },
}
