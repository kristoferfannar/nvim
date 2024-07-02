vim.opt.termguicolors = true
require("bufferline").setup({
	options = {
		mode = "tabs",
		diagnostics = "nvim_lsp",
		show_tab_indicators = true,
		numbers = function(opts)
			return string.format("%s", opts.ordinal)
		end,
	},
})
