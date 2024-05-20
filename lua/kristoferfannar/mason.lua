local servers = {
	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = 'Replace',
				},
			},
		},
	},
	clangd = {},
	gopls = {},
	tsserver = {},
}


require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = vim.tbl_keys(servers or {}),
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			require('lspconfig')[server_name].setup(server)
		end,
	},
})
