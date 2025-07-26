return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzf-native.nvim"
  },
  lazy = true,
  cmd = { "Telescope", "FindFiles" },
  opts = {
    require("telescope").setup {
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- even more opts
          }

          -- pseudo code / specification for writing custom displays, like the one
          -- for "codeactions"
          -- specific_opts = {
          --   [kind] = {
          --     make_indexed = function(items) -> indexed_items, width,
          --     make_displayer = function(widths) -> displayer
          --     make_display = function(displayer) -> function(e)
          --     make_ordinal = function(e) -> string
          --   },
          --   -- for example to disable the custom builtin "codeactions" display
          --      do the following
          --   codeactions = false,
          -- }
        }
      }
    }

  },

  config = function()
    require("telescope").setup {}
    require("telescope").load_extension("ui-select")
  end,

  keys = {
    {
      '<leader> ',
      '<cmd>Telescope find_files<CR>',
      "n",
      desc = "Find file",
      noremap = true,
      silent = true,
    },
    { '<leader> ',  '<cmd>Telescope find_files<CR>',                        "n", desc = "Find file",                  noremap = true, silent = true },
    { '<leader>/',  '<cmd>Telescope live_grep<CR>',                         "n", desc = "Find text (global)",         noremap = true, silent = true },
    { '<leader>f/', '<cmd>Telescope current_buffer_fuzzy_find<CR>',         "n", desc = "Find text (buffer)",         noremap = true, silent = true },
    { '<leader>fb', '<cmd>Telescope buffers<CR>',                           "n", desc = "Find buffer",                noremap = true, silent = true },
    { '<leader>fg', '<cmd>Telescope git_files<CR>',                         "n", desc = "Find git file",              noremap = true, silent = true },
    { '<leader>fc', '<cmd>Telescope command_history<CR>',                   "n", desc = "Find past command",          noremap = true, silent = true },
    { '<leader>fs', '<cmd>Telescope search_history<CR>',                    "n", desc = "Find past search",           noremap = true, silent = true },
    { '<leader>fm', '<cmd>Telescope marks<CR>',                             "n", desc = "Find marks",                 noremap = true, silent = true },
    { '<leader>ff', '<cmd>Telescope resume<CR>',                            "n", desc = "Resume search",              noremap = true, silent = true },

    { '<leader>sc', '<cmd>Telescope commands<CR>',                          "n", desc = "Search commands",            noremap = true, silent = true },
    { '<leader>sk', '<cmd>Telescope keymaps<CR>',                           "n", desc = "Search normal mode keymaps", noremap = true, silent = true },
    { '<leader>sr', '<cmd>Telescope registers<CR>',                         "n", desc = "Search commands",            noremap = true, silent = true },


    { '<leader>cr', '<cmd>Telescope lsp_references<CR>',                    "n", desc = "Find references(all)",       noremap = true, silent = true },
    { '<leader>ci', '<cmd>Telescope lsp_incoming_calls<CR>',                "n", desc = "Find references(incoming)",  noremap = true, silent = true },
    { '<leader>co', '<cmd>Telescope lsp_outgoing_calls<CR>',                "n", desc = "Find references(outgoing)",  noremap = true, silent = true },
    { '<leader>cs', '<cmd>Telescope lsp_document_symbols<CR>',              "n", desc = "Find symbols(buffer)",       noremap = true, silent = true },
    { '<leader>cS', '<cmd>Telescope lsp_workspace_symbols<CR>',             "n", desc = "Find symbols(global)",       noremap = true, silent = true },
    { '<leader>cd', '<cmd>Telescope diagnostics bufnr=0<CR>',               "n", desc = "Find diagnostics(buffer)",   noremap = true, silent = true },
    { '<leader>cD', '<cmd>Telescope diagnostics<CR>',                       "n", desc = "Find diagnostics(global)",   noremap = true, silent = true },


    { '<leader>gi', '<cmd>Telescope lsp_implementations<CR>',               "n", desc = "Go to implementation",       noremap = true, silent = true },
    { '<leader>gd', '<cmd>Telescope lsp_definitions theme=cursor<CR>',      "n", desc = "Go to definition",           noremap = true, silent = true },
    { '<leader>gt', '<cmd>Telescope lsp_type_definitions theme=cursor<CR>', "n", desc = "Go to type definition",      noremap = true, silent = true },






  },
}
