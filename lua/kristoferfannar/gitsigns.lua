require('gitsigns').setup({
	signs = {
		add          = { text = '+' },
		change       = { text = '┃' },
		delete       = { text = '_' },
		topdelete    = { text = '‾' },
		changedelete = { text = '~' },
		untracked    = { text = '┆' },
	},
	current_line_blame = true,
	current_line_blame_formatter = '<author>, <author_time:%d %b %Y> - <summary>',
})