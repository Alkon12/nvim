return {
  -- Explorador de archivos
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle Explorer" },
    },
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },

  -- Mejoras en el aspecto visual
  { "nvim-tree/nvim-web-devicons", lazy = true },
}
