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
      })
    end,
  },
}
