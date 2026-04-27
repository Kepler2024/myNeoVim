return {
  "zbirenbaum/copilot.lua",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      hide_during_completion = false, -- blink 菜单弹出时也保留 copilot 建议
      keymap = {
        accept = false,
        accept_word = "<S-Tab>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
    },
    panel = { enabled = false },
  },

  -- vim.api.nvim_create_autocmd("User", {
  --   pattern = "BlinkCmpMenuClose",
  --   callback = function()
  --     vim.b.copilot_suggestion_hidden = false
  --   end,
  -- }),
}
