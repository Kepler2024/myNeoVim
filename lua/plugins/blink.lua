return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default",
      ["<Tab>"] = {
        function()
          local suggestion = require("copilot.suggestion")
          if suggestion.is_visible() then
            suggestion.accept_line()
            return true -- 关键:返回 true 表示这次按键已处理
          end
        end,
        "select_next", -- copilot 没建议时,走 blink 默认行为
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = {
        function()
          local suggestion = require("copilot.suggestion")
          if suggestion.is_visible() then
            suggestion.accept_word()
            return true
          end
        end,
        "select_prev",
        "snippet_backward",
        "fallback",
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        copilot = nil,
      },
    },
  },
}
