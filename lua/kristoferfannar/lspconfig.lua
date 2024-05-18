local lspconfig = require("lspconfig")
-- When searching for binary names
-- for new LSP's, refer to 
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
lspconfig["lua_ls"].setup({})
lspconfig["clangd"].setup({})
lspconfig["gopls"].setup({})
lspconfig["tsserver"].setup({}) -- for typescript-language-server
