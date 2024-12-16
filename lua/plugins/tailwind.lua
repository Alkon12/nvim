return {
  -- Soporte para Tailwind CSS
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Añadir configuración de Tailwind
      opts.servers.tailwindcss = {
        filetypes = {
          "html",
          "css",
          "scss",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
          "svelte",
          "php",
          "twig",
        },
        settings = {
          tailwindCSS = {
            validate = true,
            lint = {
              cssConflict = "warning",
              invalidApply = "error",
            },
          },
        },
        root_dir = require("lspconfig.util").root_pattern(
          "tailwind.config.js",
          "tailwind.config.cjs",
          "tailwind.config.ts"
        ),
      }

      return opts
    end,
  },

  -- Colorización de Tailwind en autocompletado
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = true,
    dependencies = { "hrsh7th/nvim-cmp" },
  },
}
