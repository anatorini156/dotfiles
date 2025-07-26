return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },

    keys = {
        {"<leader>e", "<cmd>NvimTreeToggle<cr>", "n", desc = "NvimTree" },
	{"<leader>r", "<cmd>NvimTreeFindFile<cr>","n", desc = "NvimTreeReveal" }
    },
  }
