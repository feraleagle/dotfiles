-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Exit insert mode with JJ
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit Insert Mode" })

-- Jump word backward/forward in Insert mode
vim.keymap.set("i", "<C-l>", "<C-o>w", { noremap = true, silent = true }) -- jump forward one word
vim.keymap.set("i", "<C-h>", "<C-o>b", { noremap = true, silent = true }) -- jump back one word

-- Jump to start/ end of line in Insert mode
vim.keymap.set("i", "<C-a>", "<C-o>^", { desc = "Goto First Non-Blank Character In Insert Mode"})
vim.keymap.set("i", "<C-e>", "<C-o>$", { desc = "Goto End of Line In Insert Mode"})
