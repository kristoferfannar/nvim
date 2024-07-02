vim.api.nvim_set_keymap("n", "<space>", "", { noremap = true, silent = true })

vim.o.timeout = true
vim.o.timeoutlen = 300

local function create_new_tab()
	vim.cmd("tablast")
	vim.cmd("tabnew")
	vim.cmd("Oil")
end

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
	x = { "<cmd>x!<cr>", "Write Quit" },
	X = { "<cmd>xall<cr>", "Write Quit All" },
	f = {
		name = "+files",
		f = { "<cmd>Telescope find_files<cr>", "Local files" },
		e = { ":Oil --float<cr>", "File explorer" },
		g = { "<cmd>Telescope live_grep<cr>", "live grep" },
	},

	l = {
		name = "lsp",
		f = { "<cmd>lua vim.lsp.buf.format { async = true}<cr>", "Format file" },
		r = { "<cmd>lua vim.lsp.buf.rename { async = true}<cr>", "Rename word" },
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
		t = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle blame" },
	},

	b = {
		name = "screen split",
		l = { ":vsplit<cr><c-w>l", "split right" },
	},

	d = { "<cmd>TroubleToggle<cr>", "Toggle Diagnostics" },
	["<Tab>"] = {
		name = "tabs",
		-- ["\t"] = { "<cmd>tabnew<cr><cmd>Oil<cr>", "new tab" },
		["<Tab>"] = { create_new_tab, "new tab" },
		n = { "<cmd>tabnext<cr>", "next tab" },
		p = { "<cmd>tabprevious<cr>", "previous tab" },
		["1"] = { "<cmd>tabn 1<cr>", "goto tab 1" },
		["2"] = { "<cmd>tabn 2<cr>", "goto tab 2" },
		["3"] = { "<cmd>tabn 3<cr>", "goto tab 3" },
		["4"] = { "<cmd>tabn 4<cr>", "goto tab 4" },
		["5"] = { "<cmd>tabn 5<cr>", "goto tab 5" },
		["6"] = { "<cmd>tabn 6<cr>", "goto tab 6" },
		["7"] = { "<cmd>tabn 7<cr>", "goto tab 7" },
		["0"] = { "<cmd>tabfirst<cr>", "goto first tab" },
	},
}, { noremap = true, silent = true, prefix = "<leader>" })
