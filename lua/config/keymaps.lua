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

-- Basic tmux commands
vim.keymap.set("n", "<leader>ct", ":CodeBridgeTmux<CR>", { desc = "Send file to claude" })
vim.keymap.set("v", "<leader>ct", ":CodeBridgeTmux<CR>", { desc = "Send selection to claude" })
vim.keymap.set("n", "<leader>ca", ":CodeBridgeTmuxAll<CR>", { desc = "Send all buffers to claude" })

-- Advanced tmux commands
vim.keymap.set("n", "<leader>ci", ":CodeBridgeTmuxInteractive<CR>", { desc = "Interactive prompt to claude" })
vim.keymap.set("n", "<leader>cd", ":CodeBridgeTmuxDiff<CR>", { desc = "Send git diff to claude" })
vim.keymap.set("n", "<leader>cr", ":CodeBridgeTmuxRecent<CR>", { desc = "Send recent files to claude" })
vim.keymap.set("n", "<leader>ce", ":CodeBridgeTmuxDiagnostics<CR>", { desc = "Send diagnostics to claude" })

-- Chat interface
vim.keymap.set("n", "<leader>cq", ":CodeBridgeQuery<CR>", { desc = "Query claude with context" })
vim.keymap.set("v", "<leader>cq", ":CodeBridgeQuery<CR>", { desc = "Query claude with selection" })
vim.keymap.set("n", "<leader>cc", ":CodeBridgeChat<CR>", { desc = "Chat with claude" })
vim.keymap.set("n", "<leader>ch", ":CodeBridgeHide<CR>", { desc = "Hide chat window" })
vim.keymap.set("n", "<leader>cs", ":CodeBridgeShow<CR>", { desc = "Show chat window" })
vim.keymap.set("n", "<leader>cx", ":CodeBridgeWipe<CR>", { desc = "Wipe chat and clear history" })
vim.keymap.set("n", "<leader>ck", ":CodeBridgeCancelQuery<CR>", { desc = "Cancel running query" })
vim.keymap.set("n", "<leader>cp", ":CodeBridgeResumePrompt<CR>", { desc = "Resume hidden prompt" })
