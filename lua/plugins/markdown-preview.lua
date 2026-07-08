return {
  "Kepler2024/iTerm-preview.nvim",
  dependencies = {
    { "iamcco/markdown-preview.nvim", build = "cd app && npm install" },
  },
  ft = "markdown",
  opts = {}, -- defaults work out of the box once the iTerm profile exists
}
