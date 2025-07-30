local lspconfig = require("lspconfig")

local servers = {
	"lua_ls",
	"clangd",
	"ts_ls",
	"pyright",
	"jsonls",
	"cssls",
	"html",
	"yamlls",
	"kotlin_language_server",
  "java_language_server",
}
for _, server in ipairs(servers) do
	lspconfig[server].setup({})
end

lspconfig.zls.setup({
	on_attach = function(client, bufnr)
		local navic = require("nvim-navic")
		navic.attach(client, bufnr)
	end,
})

lspconfig.nil_ls.setup({
	--    settings = {
	--       ['nil'] = {
	--          formatting = {
	--             command = { "nixfmt" },
	--          },
	--       },
	--    },
})
