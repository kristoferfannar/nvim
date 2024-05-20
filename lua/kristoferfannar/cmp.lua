local cmp = require 'cmp'
local luasnip = require 'luasnip'

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup {

	-- Snippet engine is not built into cmp
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
				-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
				-- they way you will only jump inside the snippet region
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		['<C-e>'] = cmp.mapping.abort(),              -- hide autocomplete options
	},
	sources = cmp.config.sources({
		{ name = 'luasnip' },
		{ name = 'codeium', keyword_length = 5 },
		{ name = 'nvim_lsp' },
		{ name = 'emoji' },
		{ name = 'nvim_lua' },
		{ name = 'path',    max_items_count = 4 },
		{ name = 'buffer',  max_items_count = 4, keyword_length = 5 },
	}),

	-- formatting = {
	-- 	format = require('lspkind').cmp_format {
	-- 		mode = 'symbol_text',
	-- 		maxwidth = 50,
	-- 		menu = {
	-- 			buffer = "[󰈔]",
	-- 			nvim_lsp = "[]",
	-- 			nvim_lua = "[]",
	-- 			path = "[󰉋]",
	-- 			luasnip = "[󰆦]",
	-- 			Codeium = "[󰧑]",
	-- 		},
	-- 	},
	-- },

	experimental = {
		ghost_text = true
	}
}

cmp.setup.cmdline('/', {
	sources = cmp.config.sources({
		{ name = 'buffer' }
	})
})

cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = 'cmdline' },
	})
})
