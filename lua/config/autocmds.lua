-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

config = function()
  require("project_nvim").setup({
    detection_methods = { "pattern", "lsp" },
    patterns = { ".git", "Makefile", "package.json", "composer.json" },
    show_hidden = true,
  })

  -- Cargar la extensión justo después de que Neovim esté completamente iniciado
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      require("telescope").load_extension("projects")
    end,
  })
end
