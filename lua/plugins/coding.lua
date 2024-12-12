return {
  -- Paréntesis automáticos
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

  -- Comentarios
  { "numToStr/Comment.nvim", event = "VeryLazy", opts = {} },

  -- Surround
  { "kylechui/nvim-surround", event = "VeryLazy", opts = {} },

  -- Refactorización
  {
    "ThePrimeagen/refactoring.nvim",
    event = "VeryLazy",
    config = function()
      require("refactoring").setup({})
    end,
  },

  -- Vista de símbolos (documentación y símbolos)
  { "simrat39/symbols-outline.nvim", cmd = "SymbolsOutline", opts = {} },
  -- Snippets
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets", -- Incluye snippets para React, PHP, etc.
    },
    opts = function(_, opts)
      require("luasnip.loaders.from_vscode").lazy_load()
      return opts
    end,
  },
}
