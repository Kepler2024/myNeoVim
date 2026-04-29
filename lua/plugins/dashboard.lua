return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
 █████   ████                    ████                    
▒▒███   ███▒                    ▒▒███                    
 ▒███  ███     ██████  ████████  ▒███   ██████  ████████ 
 ▒███████     ███▒▒███▒▒███▒▒███ ▒███  ███▒▒███▒▒███▒▒███
 ▒███▒▒███   ▒███████  ▒███ ▒███ ▒███ ▒███████  ▒███ ▒▒▒ 
 ▒███ ▒▒███  ▒███▒▒▒   ▒███ ▒███ ▒███ ▒███▒▒▒   ▒███     
 █████ ▒▒████▒▒██████  ▒███████  █████▒▒██████  █████    
▒▒▒▒▒   ▒▒▒▒  ▒▒▒▒▒▒   ▒███▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒▒  ▒▒▒▒▒     
                       ▒███                              
                       █████                             
                      ▒▒▒▒▒                              ]],
        keys = {
          { icon = "\u{f422} ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = "\u{f07b} ", key = "p", desc = "Projects", action = ":lua Snacks.dashboard.pick('projects')" },
          { icon = "\u{f4a1} ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = "\u{f0c5} ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = "\u{f013} ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = "\u{f487} ", key = "L", desc = "Lazy", action = ":Lazy" },
          { icon = "\u{f08b} ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      formats = {
        footer = { "%s", align = "center" },
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" }, -- 那个 "Neovim loaded..." 行
        {
          text = { { "  KK@terminal · harrykepler.com", hl = "footer" } },
          align = "center",
        },
      },
    },
  },
}
