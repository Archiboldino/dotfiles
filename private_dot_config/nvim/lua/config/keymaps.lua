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

vim.keymap.set("n", "<leader>jn", "<cmd>%!jq --sort-keys .<CR>", { desc = "Normalize JSON" })

-- vim.keymap.set("n", "d", '"-d')
-- vim.keymap.set("n", "D", '"-D')
vim.keymap.set("n", "c", '"-c')
vim.keymap.set("n", "C", '"-C')
vim.keymap.set("n", "x", '"-x')
-- vim.keymap.set("x", "d", '"-d')
-- vim.keymap.set("x", "D", '"-D')
vim.keymap.set("x", "c", '"-c')
vim.keymap.set("x", "C", '"-C')
vim.keymap.set("x", "x", '"-x')
vim.keymap.set("x", "p", '"-dP')
