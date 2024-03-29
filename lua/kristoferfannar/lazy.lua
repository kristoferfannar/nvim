return {
	"folke/which-key.nvim",
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"rafamadriz/friendly-snippets",
	{
		"L3MON4D3/LuaSnip",
		run = "make install_jsregexp",
	},

	"hrsh7th/nvim-cmp",      -- Autocompletion plugin
	"hrsh7th/cmp-buffer",    -- Autocompletion source
	"hrsh7th/cmp-path",      -- Autocompletion source
	"hrsh7th/cmp-nvim-lsp",  -- Autocompletion source
	"hrsh7th/cmp-nvim-lua",  -- Autocompletion source
	"hrsh7th/cmp-cmdline",   -- Autocompletion source
	"hrsh7th/cmp-emoji",     -- Autocompletion source
	"saadparwaiz1/cmp_luasnip", -- Snippets src for nvim-cmp

	{
		"stevearc/oil.nvim",
		config = function() require("oil").setup() end
	},
	{
		'nvim-tree/nvim-web-devicons',
		config = function() require("nvim-web-devicons").setup() end,
	},

	-- Color scheme
	-- { 'rose-pine/neovim', name = 'rose-pine' },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	},


	-- autopairs for closing brackets
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},

	-- Git stuff
	{
		'tpope/vim-fugitive',
		event = "VeryLazy",
		config = function()
			vim.cmd("call FugitiveDetect(getcwd())")
		end
	},
	{ 'sodapopcan/vim-twiggy' }, -- improved git branch view

	-- Commenting
	{
		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
		},
		lazy = false,
	},

}
