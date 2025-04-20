require("actions-preview").setup({
	diff = {
		algorithm = "patience",
		ignore_whitespace = true,
	},
	telescope = require("telescope.themes").get_dropdown({
		layout_config = {
			width = 0.8, -- or 0.8, or an absolute integer
			height = 0.4, -- same idea
			prompt_position = "top",
		},
	}),

	highlight_command = {
		require("actions-preview.highlight").delta(),
	},
})
