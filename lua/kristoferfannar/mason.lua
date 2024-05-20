local servers = {
	"lua_ls",
	"clangd",
	"gopls",
	"tsserver"
}


require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = servers,
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	},
})
