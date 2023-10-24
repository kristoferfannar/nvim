vim.api.nvim_set_keymap("n", "<space>", "", { noremap = true, silent = true })

vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require("which-key")

wk.register({
	["<c-h>"] = { "<c-w>h", "Move cursor left" },
	["<c-j>"] = { "<c-w>j", "Move cursor down" },
	["<c-k>"] = { "<c-w>k", "Move cursor up" },
	["<c-l>"] = { "<c-w>l", "Move cursor right" },
}, { noremap = true, silent = true, mode = "n" })

wk.register({
	w = { "<cmd>w<cr>", "Write" },
	q = { "<cmd>Ex<cr>", "Exit file" },
	x = { "<cmd>x<cr>", "Write Quit" },
	f = {
		name = "+files",
		f = { "<cmd>Telescope find_files<cr>", "Local files" },
		e = { ":Oil --float<cr>", "File explorer" },
	},

	l = {
		name = "lsp",
		f = { "<cmd>lua vim.lsp.buf.format { async = true}<cr>", "Format file" },
	},


}, { noremap = true, silent = true, prefix = "<leader>" })
