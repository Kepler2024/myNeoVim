return {
  -- 关掉 markdown 的 trailing whitespace 高亮
  {
    "LazyVim/LazyVim",
    opts = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown" },
        callback = function()
          vim.opt_local.list = false -- 关掉 listchars 显示
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
