local nvim_lsp = require("lspconfig")

nvim_lsp.lua_ls.setup({})
nvim_lsp.clangd.setup({})
nvim_lsp.ts_ls.setup({})
nvim_lsp.pyright.setup({})
nvim_lsp.jsonls.setup({})
nvim_lsp.cssls.setup({})
nvim_lsp.html.setup({})
nvim_lsp.yamlls.setup({})
nvim_lsp.zls.setup({})

nvim_lsp.nil_ls.setup({
   settings = {
      ['nil'] = {
         formatting = {
            command = { "nixfmt" },
         },
      },
   },
})

