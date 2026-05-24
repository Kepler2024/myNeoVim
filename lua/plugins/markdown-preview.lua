return {
  dir = "/Users/harry/Desktop/GitHub/Personal/builtin-mdpreview.nvim/iterm-mdpreview.nvim",
  name = "iterm-mdpreview.nvim",
  dependencies = {
    {
      "iamcco/markdown-preview.nvim",
      build = "cd app && npm install",
      ft = { "markdown" },
    },
  },
  ft = "markdown",
  config = function()
    require("iterm-mdpreview").setup({
      profile = "Browser", -- 改成你的 iTerm Browser profile 名字
    })
  end,
}
