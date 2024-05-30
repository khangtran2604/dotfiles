local globals = {
	mapleader = ' ',
	maplocalleader = ' ',
	have_nerd_font = true
}

local opts = {
	number = true,
	relativenumber = true,
	mouse = 'a',
	showmode = false,
	clipboard = 'unnamedplus',
	breakindent = true,
	undofile = true,
	ignorecase = true,
	smartcase = true,
	signcolumn = 'yes',
	updatetime = 250,
	timeoutlen = 300,
	splitright = true,
	splitbelow = true,
	list = true,
	listchars = { tab = '» ', trail = '·', nbsp = '␣' },
	inccommand = 'split',
	cursorline = true,
	scrolloff = 10,
	hlsearch = true,
	termguicolors = true,
	smartindent = true,
	swapfile = false,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2
}

for k, v in pairs(globals) do
  vim.g[k] = v
end

for k, v in pairs(opts) do
  vim.opt[k] = v
end
