vim.api.nvim_set_keymap("n", "<space>", "", { noremap = true, silent = true })

vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require("which-key")

local function create_new_tab()
	vim.cmd("tablast")
	vim.cmd("tabnew")
	vim.cmd("Oil")
end

wk.add({
	{ "<c-h>", "<c-w>h", desc = "Move cursor left",  remap = false },
	{ "<c-j>", "<c-w>j", desc = "Move cursor down",  remap = false },
	{ "<c-k>", "<c-w>k", desc = "Move cursor up",    remap = false },
	{ "<c-l>", "<c-w>l", desc = "Move cursor right", remap = false },
})

wk.add({
	{ "<leader><Tab>", group = "tabs",         remap = false },
	{
		"<leader><Tab>0",
		"<cmd>tabfirst<cr>",
		desc = "goto first tab",
		remap = false,
	},
	{
		"<leader><Tab>1",
		"<cmd>tabn 1<cr>",
		desc = "goto tab 1",
		remap = false,
	},
	{
		"<leader><Tab>2",
		"<cmd>tabn 2<cr>",
		desc = "goto tab 2",
		remap = false,
	},
	{
		"<leader><Tab>3",
		"<cmd>tabn 3<cr>",
		desc = "goto tab 3",
		remap = false,
	},
	{
		"<leader><Tab>4",
		"<cmd>tabn 4<cr>",
		desc = "goto tab 4",
		remap = false,
	},
	{
		"<leader><Tab>5",
		"<cmd>tabn 5<cr>",
		desc = "goto tab 5",
		remap = false,
	},
	{
		"<leader><Tab>6",
		"<cmd>tabn 6<cr>",
		desc = "goto tab 6",
		remap = false,
	},
	{
		"<leader><Tab>7",
		"<cmd>tabn 7<cr>",
		desc = "goto tab 7",
		remap = false,
	},
	{
		"<leader><Tab><Tab>",
		create_new_tab,
		desc = "new tab",
		remap = false,
	},
	{
		"<leader><Tab>n",
		"<cmd>tabnext<cr>",
		desc = "next tab",
		remap = false,
	},
	{
		"<leader><Tab>p",
		"<cmd>tabprevious<cr>",
		desc = "previous tab",
		remap = false,
	},
	{
		"<leader>X",
		"<cmd>xall<cr>",
		desc = "Write Quit All",
		remap = false,
	},
	{ "<leader>b",     group = "screen split", remap = false },
	{
		"<leader>bl",
		":vsplit<cr><c-w>l",
		desc = "split right",
		remap = false,
	},
	{
		"<leader>d",
		"<cmd>TroubleToggle<cr>",
		desc = "Toggle Diagnostics",
		remap = false,
	},
	{ "<leader>f", group = "files", remap = false },
	{
		"<leader>fe",
		":Oil --float<cr>",
		desc = "File explorer",
		remap = false,
	},
	{
		"<leader>ff",
		"<cmd>Telescope find_files<cr>",
		desc = "Local files",
		remap = false,
	},
	{
		"<leader>fg",
		"<cmd>Telescope live_grep<cr>",
		desc = "live grep",
		remap = false,
	},
	{ "<leader>g", group = "git",   remap = false },
	{
		"<leader>ga",
		"<cmd>Git add .<cr>",
		desc = "Git add .",
		remap = false,
	},
	{
		"<leader>gb",
		"<cmd>Twiggy<cr>",
		desc = "Git branch",
		remap = false,
	},
	{
		"<leader>gc",
		"<cmd>Git commit<cr>",
		desc = "Git commit",
		remap = false,
	},
	{
		"<leader>gf",
		"<cmd>Git fetch<cr>",
		desc = "Git fetch",
		remap = false,
	},
	{
		"<leader>gl",
		"<cmd>Git log<cr><c-w>H<cmd>vertical resize -30<cr>",
		desc = "Git log",
		remap = false,
	},
	{
		"<leader>gpl",
		"<cmd>Git pull<cr>",
		desc = "Git pull",
		remap = false,
	},
	{
		"<leader>gps",
		"<cmd>Git push<cr>",
		desc = "Git push",
		remap = false,
	},
	{
		"<leader>gs",
		"<cmd>Git<cr><c-w>H<cmd>vertical resize -40<cr>",
		desc = "Git status",
		remap = false,
	},
	{
		"<leader>gt",
		"<cmd>Gitsigns toggle_current_line_blame<cr>",
		desc = "Toggle blame",
		remap = false,
	},
	{ "<leader>l", group = "lsp", remap = false },
	{
		"<leader>lf",
		"<cmd>lua vim.lsp.buf.format { async = true}<cr>",
		desc = "Format file",
		remap = false,
	},
	{
		"<leader>lr",
		"<cmd>lua vim.lsp.buf.rename()<cr>",
		desc = "Rename word",
		remap = false,
	},
	{
		"<leader>la",
		require("actions-preview").code_actions,
		desc = "Code actions",
		remap = false,
	},
	{
		"<leader>q",
		"<cmd>q!<cr>",
		desc = "Exit file",
		remap = false,
	},
	{
		"<leader>w",
		"<cmd>w<cr>",
		desc = "Write",
		remap = false,
	},
	{
		"<leader>x",
		"<cmd>x!<cr>",
		desc = "Write Quit",
		remap = false,
	},
	{
		"<leader>y",
		"mzggVG\"+y`z",
		desc = "Yank Buffer",
		remap = false,
	},
})

-- highlight selection on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 250 }
  end,
})

-- visual mode remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

