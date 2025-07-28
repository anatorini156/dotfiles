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
	"zls",
	"kotlin_language_server",
}
for _, server in ipairs(servers) do
	lspconfig[server].setup({})
end

lspconfig.nil_ls.setup({
	--    settings = {
	--       ['nil'] = {
	--          formatting = {
	--             command = { "nixfmt" },
	--          },
	--       },
	--    },
})
