return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      {
        "]m",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
        end,
        mode = { "n", "x", "o" },
        desc = "Next function start",
      },
      {
        "[m",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
        end,
        mode = { "n", "x", "o" },
        desc = "Prev function start",
      },
      {
        ";",
        function()
          require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move()
        end,
        mode = { "n", "x", "o" },
        desc = "Repeat last move",
      },
      {
        ",",
        function()
          require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_opposite()
        end,
        mode = { "n", "x", "o" },
        desc = "Repeat last move opposite",
      },
    },
  },
}
