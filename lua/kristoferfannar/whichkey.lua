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
	q = { "<cmd>q!<cr>", "Exit file" },
	x = { "<cmd>x<cr>", "Write Quit" },
	f = {
		name = "+files",
		f = { "<cmd>Telescope find_files<cr>", "Local files" },
		e = { ":Oil --float<cr>", "File explorer" },
		g = { "<cmd>Telescope live_grep<cr>", "live grep" },
	},

	l = {
		name = "lsp",
		f = { "<cmd>lua vim.lsp.buf.format { async = true}<cr>", "Format file" },
		r = { "<cmd>lua vim.lsp.buf.rename { async = true}<cr>", "Rename word" }
	},


	g = {
		name = "git",
		s = { "<cmd>Git<cr><c-w>H<cmd>vertical resize -40<cr>", "Git status" },
		a = { "<cmd>Git add .<cr>", "Git add ." },
		c = { "<cmd>Git commit<cr>", "Git commit" },
		ps = { "<cmd>Git push<cr>", "Git push" },
		pl = { "<cmd>Git pull<cr>", "Git pull" },
		l = { "<cmd>Git log<cr><c-w>H<cmd>vertical resize -30<cr>", "Git log" },
		f = { "<cmd>Git fetch<cr>", "Git fetch" },
		b = { "<cmd>Twiggy<cr>", "Git branch" },
	},

	b = {
		name = "screen split",
		l = { ":vsplit<cr><c-w>l", "split right" },
	},
}, { noremap = true, silent = true, prefix = "<leader>" })
