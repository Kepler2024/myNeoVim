-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>bd", function()
  Snacks.bufdelete()
  if #vim.fn.getbufinfo({ buflisted = 1 }) == 0 then
    Snacks.dashboard()
  end
end, { desc = "Delete buffer and show dashboard" })

-- 回到 dashboard
vim.keymap.set("n", "<leader>;", function()
  if pcall(require, "snacks") then
    Snacks.dashboard()
  end
end, { desc = "Dashboard" })
