return {
  "folke/trouble.nvim",
  lazy=false,
  opts = {
--	  auto_open = true,
	  icons = {
    indent = {
      middle = " ",
      last = " ",
      top = " ",
      ws = "│  ",
    },
  },
  modes = {
	  modes = {
        lsp = {
          win = { position = "right" },
        },
      },
  },
},
  cmd = "Trouble",
  keys = {
  },
  config = 
  function()
	  vim.diagnostic.config({
	  virtual_text = true,
	  signs = false,              -- gutter icons (E/W)
	  underline = true,          -- underline error text
	  update_in_insert = false,
	  severity_sort = true,
	})
	vim.keymap.set('n', '<leader>ca', function()
  vim.lsp.buf.code_action({ filter = function(a) return a.isPreferred end, apply = true })
end, { desc = "Apply preferred code action if available" })

  end


}
