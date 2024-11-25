local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = "\\"
g.have_nerd_font = true

opt.number = true
opt.relativenumber = false
opt.conceallevel = 1
opt.breakindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 500
opt.cursorline = true
opt.background = "light"
opt.mouse = "a"
opt.showmode = false
opt.clipboard = "unnamedplus"
opt.laststatus = 3

vim.diagnostic.config({
	virtual_text = false,
	float = {
		header = true,
		border = "rounded",
		focusable = true,
	},
})
vim.o.cmdheight=0
vim.cmd.colorscheme("default")
