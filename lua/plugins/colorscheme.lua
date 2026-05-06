return {
  -- 配置 tokyonight 的样式
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night", -- 可选: "night" | "storm" | "day" | "moon"
    },
  },

  -- 告诉 LazyVim 用哪个 colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
