local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("kristoferfannar.set")

local packages = require("kristoferfannar.lazy")
require("lazy").setup(packages)
require("kristoferfannar.actions")
require("kristoferfannar.bufferline")
require("kristoferfannar.whichkey")
require("kristoferfannar.telescope")
require("kristoferfannar.treesitter")
require("kristoferfannar.mason")
require("kristoferfannar.cmp")
require("kristoferfannar.colorscheme")
require("kristoferfannar.comment")
require("kristoferfannar.oil")
require("kristoferfannar.gitsigns")
require("kristoferfannar.lualine")
require("kristoferfannar.fidget")
require("kristoferfannar.none-ls")
require("kristoferfannar.lint")
