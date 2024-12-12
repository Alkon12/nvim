return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "prettier",
        "eslint_d",
        "intelephense",
        "php-cs-fixer",
        --"twigls",
        "black",
        "isort",
        "mypy",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "jay-babu/mason-null-ls.nvim" },
    opts = function()
      local null_ls = require("null-ls")
      return {
        sources = {
          -- JS/TS
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.eslint_d,

          -- Python
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.diagnostics.mypy,
          null_ls.builtins.diagnostics.flake8,

          -- PHP
          null_ls.builtins.formatting.phpcsfixer,
        },
      }
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = { automatic_installation = true },
  },
}
