local capabilities = vim.lsp.protocol.make_client_capabilities()
local InlayHighlight = require("kristoferfannar.colorscheme")

-- add capabilities from cmp_nvim
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

local servers = {
	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	},
	-- clangd = {
	-- cmd = {
	-- 	"clangd",
	-- 	"--header-insertion=never",
	-- },
	-- cmd = {
	-- 	"/opt/homebrew/Cellar/llvm/19.1.2/bin/clangd",
	-- },
	-- },
	gopls = {},
	ts_ls = {},
	bashls = {},
	rust_analyzer = {
		cmd = {
			"rustup",
			"run",
			"stable",
			"rust-analyzer",
		},
	},
	pyright = {},
	emmet_ls = {
		filetypes = { "html" },
	},
	cssls = {},
}

--  This function gets run when an LSP attaches to a particular buffer.
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		-- allows us to create keybinding for the lsp
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		local cli = vim.lsp.get_client_by_id(event.data.client_id)
		if cli ~= nil and cli.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true, { bufno = event.buf })
			InlayHighlight()
		end
		-- Jump to the definition of the word under your cursor.
		--  To jump back, press <C-t>.
		map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
		map("K", vim.lsp.buf.hover, "Hover")

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		--    See `:help CursorHold` for information about when this is executed
		--
		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
				end,
			})
		end
	end,
})

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = vim.tbl_keys(servers or {}),
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			-- extend capabilities with cmp_nvim from above
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			require("lspconfig")[server_name].setup(server)
		end,
	},
})
