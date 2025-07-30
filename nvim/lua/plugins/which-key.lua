return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    spec = {
      { "<leader>b", group = "Buffer" },
      { "<leader>c", group = "Code" },
      { "<leader>w", group = "Window" },
      { "<leader>f", group = "Find" },
      { "<leader>s", group = "Search" },
      { "<leader>g", group = "Goto/Git" },
    },
  },
  keys = {

    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
