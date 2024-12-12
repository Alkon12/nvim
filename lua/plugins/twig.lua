return {
  -- Resaltado de Sintaxis para Twig
  {
    "lumiliet/vim-twig",
    ft = { "twig" },
  },

  -- Treesitter para Twig
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "twig", "php", "html", "javascript", "css" },
    },
  },
}
