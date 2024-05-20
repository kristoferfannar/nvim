local capabilities = vim.lsp.protocol.make_client_capabilities()

-- add capabilities from cmp_nvim
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

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
			-- extend capabilities with cmp_nvim from above
			server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
			require('lspconfig')[server_name].setup(server)
		end,
	},
})
