-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set("n", "<leader>bd", function()
--   Snacks.bufdelete()
--   if #vim.fn.getbufinfo({ buflisted = 1 }) == 0 then
--     Snacks.dashboard()
--   end
-- end, { desc = "Delete buffer and show dashboard" })

-- 回到 dashboard
vim.keymap.set("n", "<leader>;", function()
  -- 保存所有有文件名且已修改的 buffer
  vim.cmd("silent! wall")
  -- 关闭所有 buffer
  vim.cmd("silent! %bdelete!")
  Snacks.dashboard()
end, { desc = "Save all, close all buffers, open Dashboard" })

-- 删除 buffer，但保留窗口
vim.keymap.set("n", "<leader>bd", function()
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })
  if #bufs > 1 then
    vim.cmd("BufferLineCycleNext")
  end
  Snacks.bufdelete()
end, { desc = "Delete buffer (keep window)" })

vim.keymap.set("n", "<C-/>", function()
  Snacks.terminal(nil, {
    win = {
      position = "float",
      border = "rounded",
      width = 0.8,
      height = 0.8,
    },
  })
end, { desc = "Terminal (float)" })

vim.keymap.set("n", "<leader><space>", "<Nop>", { desc = "Disabled" })
