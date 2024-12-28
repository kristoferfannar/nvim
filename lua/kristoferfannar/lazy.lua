return {
	"folke/which-key.nvim",
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"rafamadriz/friendly-snippets",
	{
		"L3MON4D3/LuaSnip",
		run = "make install_jsregexp",
	},

	"hrsh7th/nvim-cmp", -- Autocompletion plugin
	"hrsh7th/cmp-buffer", -- Autocompletion source
	"hrsh7th/cmp-path", -- Autocompletion source
	"hrsh7th/cmp-nvim-lsp", -- Autocompletion source
	"hrsh7th/cmp-nvim-lua", -- Autocompletion source
	"hrsh7th/cmp-cmdline", -- Autocompletion source
	"saadparwaiz1/cmp_luasnip", -- Snippets src for nvim-cmp
	"onsails/lspkind.nvim",
	{
		"stevearc/oil.nvim",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},

	{
		"olimorris/onedarkpro.nvim",
		priority = 1000,
	},

	-- autopairs for closing brackets
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	-- Git stuff
	{
		"tpope/vim-fugitive",
		event = "VeryLazy",
		config = function()
			vim.cmd("call FugitiveDetect(getcwd())")
		end,
	},
	{ "sodapopcan/vim-twiggy" }, -- improved git branch view

	-- Commenting
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		lazy = false,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "folke/neodev.nvim", opts = {} }, -- for vim.api autocompletion within lua
	"lewis6991/gitsigns.nvim", -- for git decorations
	"j-hui/fidget.nvim",
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},
	"nvimtools/none-ls.nvim",
	"mfussenegger/nvim-lint",

	-- for dev purposes
	-- { dir = "/Users/kristoferfannar/Desktop/projects/urlopen.nvim" },
	{
		"kristoferfannar/urlopen.nvim",
		config = function()
			require("urlopen")
		end,
	},

	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	{
		"lsig/messenger.nvim",
		config = function()
			require("messenger")
		end,
	},
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "sioyek"
		end,
	},
	{
		"MeanderingProgrammer/markdown.nvim",
		main = "render-markdown",
		opts = {},
		name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
		-- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	"aznhe21/actions-preview.nvim",
}
