vim.cmd([[colorscheme onedark]])

-- inlay hint highlighting
function InlayHighlight()
	if vim.lsp.inlay_hint.is_enabled({}) then
		vim.cmd([[highlight LspInlayHint guifg=#757880 guibg=#313234]])
	end
end

return InlayHighlight
