local none_ls = require("null-ls")

none_ls.setup({
	sources = {
		none_ls.builtins.formatting.biome, -- typescript etc
		none_ls.builtins.formatting.stylua, -- lua
		none_ls.builtins.formatting.prettier.with({
			filetypes = { "markdown" }, -- markdown
		}),
		none_ls.builtins.formatting.black, -- python
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

format_on_save()
