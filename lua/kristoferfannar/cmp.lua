local cmp = require("cmp")
local luasnip = require("luasnip")

local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local formatForTailwindCSS = function(entry, vim_item)
	if vim_item.kind == "Color" and entry.completion_item.documentation then
		local hex = entry.completion_item.documentation:match("#(%x%x%x%x%x%x)")

		if hex then
			-- log_to_file("entry.completion_item.documentation: " .. entry.completion_item.documentation)
			local group = "Tw_" .. hex
			if vim.fn.hlID(group) < 1 then
				vim.api.nvim_set_hl(0, group, { fg = "#" .. hex })
			end
			vim_item.kind = "●" -- or "■" or anything
			vim_item.kind_hl_group = group
			return vim_item
		end
	end
	vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
	return vim_item
end


require("luasnip.loaders.from_vscode").load({ paths = {"/Users/kristoferfannar/.config/nvim/lua/kristoferfannar/snippets"}})
log_to_file("loaded snippets")

cmp.setup({
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
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		-- ["<C-e>"] = cmp.mapping.abort(), -- hide autocomplete options
		["<C-f>"] = cmp.mapping.complete(),          -- open the autocomplete window
	},
	sources = cmp.config.sources({
		{ name = "luasnip" },
		-- { name = "codeium", keyword_length = 5 },
		{ name = "nvim_lsp" },
		-- { name = "emoji" },
		{ name = "nvim_lua" },
		{ name = "path",    max_items_count = 4 },
		{ name = "buffer",  max_items_count = 4, keyword_length = 5 },
	}),

	formatting = {
		format = lspkind.cmp_format({
			-- mode = "symbol_text",
			maxwidth = 50,
			-- menu = {
			-- 	buffer = "[󰈔]",
			-- 	nvim_lsp = "[]",
			-- 	nvim_lua = "[]",
			-- 	path = "[󰉋]",
			-- 	luasnip = "[󰆦]",
			-- 	Codeium = "[󰧑]",
			-- },
			before = function(entry, vim_item)
				vim_item.menu = "(" .. vim_item.kind .. ")"
				vim_item.dup = ({
					nvim_lsp = 0,
					path = 0,
				})[entry.source.name] or 0
				vim_item = formatForTailwindCSS(entry, vim_item)
				return vim_item
			end,
		}),
	},

	experimental = {
		ghost_text = true,
	},
})

cmp.setup.cmdline("/", {
	sources = cmp.config.sources({
		{ name = "buffer" },
	}),
})

cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
		{ name = "cmdline" },
	}),
})
