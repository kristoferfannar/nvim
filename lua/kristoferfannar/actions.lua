require("actions-preview").setup({
	diff = {
		algorithm = "patience",
		ignore_whitespace = true,
	},
	telescope = require("telescope.themes").get_dropdown({ winblend = 10 }),

	highlight_command = {
		require("actions-preview.highlight").delta(),
	},
})
