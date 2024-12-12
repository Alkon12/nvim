return {
  -- LazyVim base
  { "LazyVim/LazyVim", opts = { colorscheme = "catppuccin" } },

  -- Temas adicionales
  { "ellisonleao/gruvbox.nvim" },
  { "folke/tokyonight.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "macchiato", -- Cambia entre "latte", "frappe", "macchiato", "mocha"
      transparent_background = true, -- Activa las transparencias
      term_colors = true,
      integrations = {
        --lualine = true,
        bufferline = true,
        treesitter = true,
        cmp = true,
      },
    },
  },

  -- Mejoras en la línea de estado
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options = {
        theme = "catppuccin",
        globalstatus = true,
      }
      return opts
    end,
  },

  -- Barra para buffer
  { "akinsho/bufferline.nvim", event = "VeryLazy", opts = {} },

  -- Transparencia global (opcional)
  {
    "xiyaowong/nvim-transparent",
    opts = {
      enable = true, -- Activa la transparencia
      extra_groups = {
        "NormalFloat", -- Hacer que flotantes sean transparentes
        "NvimTreeNormal", -- Transparencia en NvimTree
      },
      exclude = {}, -- Grupos a excluir de la transparencia
    },
  },
}
