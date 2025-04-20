local none_ls = require("null-ls")

none_ls.setup({
	sources = {
		none_ls.builtins.formatting.biome.with({
			-- organize imports with formatting
			-- args = { "check", "--organize-imports-enabled=true", "--stdin-file-path", "$FILENAME", "--write" },
			args = { "format", "--stdin-file-path", "$FILENAME" },
		}),
		-- none_ls.builtins.formatting.biome,
		none_ls.builtins.formatting.stylua, -- lua
		none_ls.builtins.formatting.prettier.with({
			filetypes = { "markdown", "html" },
		}),
		none_ls.builtins.formatting.black, -- python

		-- format ubpf repo with clang-format-11
		none_ls.builtins.formatting.clang_format.with({
			condition = function()
				return string.find(vim.fn.getcwd(), "ubpf")
			end,
			command = "clang-format-11",
		}),
	},
})

local function format_on_save()
	vim.api.nvim_create_augroup("LspFormatting", { clear = true })
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = "LspFormatting",
		pattern = "*",
		callback = function()
			vim.lsp.buf.format()
		end,
	})
end

-- format_on_save()
