return {
  {
    "ahmedkhalf/project.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    lazy = false,
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern", "lsp" },
        patterns = { ".git", "Makefile", "package.json", "composer.json" },
        show_hidden = true,
      })

      -- Cargar la extensión de projects con un pequeño retraso
      vim.schedule(function()
        pcall(require("telescope").load_extension, "projects")
      end)
    end,
    keys = {
      { "<leader>fp", "<cmd>Telescope projects<CR>", desc = "Find Projects" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-la/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "top",
          width = 0.5,
          height = 0.5,
        },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
}
