-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Mapea <leader>t para abrir la terminal flotante
vim.keymap.set(
  "n",
  "<leader>T",
  "<cmd>ToggleTerm direction=float<CR>",
  { desc = "Abrir Terminal Flotante", silent = true, noremap = true }
)
