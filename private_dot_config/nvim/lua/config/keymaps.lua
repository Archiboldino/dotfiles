-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Bufferline
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Bufferline: Cycle to the next buffer" })
vim.keymap.set("n", "<s-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Bufferline: Cycle to the previous buffer" })

-- Go up/down in insert mode
vim.keymap.set("i", "jj", "<Esc>", { desc = "Move to normal from insert mode" })
vim.keymap.set("i", "kk", "<Esc>", { desc = "Move to normal from insert mode" })

vim.keymap.set("n", "<C-I>", "<C-I>", { noremap = true, desc = "Jumplist forward" })
