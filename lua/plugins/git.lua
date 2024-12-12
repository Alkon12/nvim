return {
  -- Signos en el margen de Git
  { "lewis6991/gitsigns.nvim", event = "BufReadPre", opts = {} },

  -- Comandos Git en Vim
  { "tpope/vim-fugitive", cmd = { "Git", "G" } },

  -- Vista de cambios en panel lateral
  { "sindrets/diffview.nvim", cmd = "DiffviewOpen" },
}
