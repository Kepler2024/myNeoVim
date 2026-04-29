-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local explorer_opened = false
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    if explorer_opened then
      return
    end
    -- 跳过非普通文件（dashboard、help、terminal 等）
    local buftype = vim.bo[args.buf].buftype
    if buftype ~= "" then
      return
    end
    explorer_opened = true
    local file_dir = LazyVim.root()
    vim.schedule(function()
      Snacks.explorer({ cwd = file_dir })
      vim.cmd("wincmd p")
    end)
  end,
})
