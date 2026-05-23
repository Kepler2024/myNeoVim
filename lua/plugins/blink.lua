return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    -- keymap 部分:直接赋值,覆盖默认
    opts.keymap = {
      preset = "default",
      ["<CR>"] = { "accept", "fallback" },
      ["<M-'>"] = { "select_next", "fallback" },
      ["<M-;>"] = { "select_prev", "fallback" },
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

    opts.completion = opts.completion or {}
    opts.completion.ghost_text = { enabled = false }
    opts.completion.list = vim.tbl_deep_extend("force", opts.completion.list or {}, {
      selection = { preselect = false, auto_insert = false },
    })

    -- cmdline (: / 搜索) 走独立配置
    opts.cmdline = opts.cmdline or {}
    opts.cmdline.keymap = {
      preset = "inherit",
      ["<CR>"] = { "accept_and_enter", "fallback" },
      ["<M-'>"] = { "select_next", "fallback" },
      ["<M-;>"] = { "select_prev", "fallback" },
    }
    opts.cmdline.completion = vim.tbl_deep_extend("force", opts.cmdline.completion or {}, {
      menu = { auto_show = true },
      list = { selection = { preselect = false, auto_insert = false } },
    })

    return opts
  end,
}
