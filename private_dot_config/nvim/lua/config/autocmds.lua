-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
--   pattern = { "*" },
--   command = "silent! wall",
--   nested = true,
-- })

vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
  callback = function()
    print(vim.v.argv[1], vim.v.argv[2], vim.v.argv[3], vim.v.argv[4])
    if vim.fn.getcwd() ~= vim.env.HOME and vim.v.argv[3] == "." then
      require("persistence").load()
    end
  end,
  nested = true,
})
