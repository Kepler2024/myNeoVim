return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    -- keymap 部分:直接赋值,覆盖默认
    opts.keymap = {
      preset = "default",
      ["<Tab>"] = {
        function()
          local suggestion = require("copilot.suggestion")
          if suggestion.is_visible() then
            suggestion.accept_line()
            return true
          end
        end,
        "select_next",
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
    }

    -- sources 部分:强制清掉 copilot
    opts.sources = opts.sources or {}
    opts.sources.default = { "lsp", "path", "snippets", "buffer" }
    if opts.sources.providers then
      opts.sources.providers.copilot = nil
    end

    return opts
  end,
}
