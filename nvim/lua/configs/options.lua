---@diagnostic disable: undefined-global
local globals = {
	mapleader = " ",
	maplocalleader = " ",
	have_nerd_font = true,
}

vim.opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
vim.opt.linebreak = true

local opts = {
	laststatus = 3,
	showmode = false,

	clipboard = "unnamedplus",
	cursorline = true,
	cursorlineopt = "number",

	-- Indenting
	expandtab = true,
	shiftwidth = 2,
	smartindent = true,
	tabstop = 2,
	softtabstop = 2,

	ignorecase = true,
	smartcase = true,
	mouse = "a",

	-- Number
	number = true,
	relativenumber = true,
	ruler = false,

	signcolumn = "yes",
	splitright = true,
	splitbelow = true,
	timeoutlen = 400,
	undofile = true,
	updatetime = 250,
	breakindent = true,
	-- list = true,
	inccommand = "nosplit",
	scrolloff = 5,
	hlsearch = true,
	termguicolors = true,
	swapfile = false,

	-- wrap = false, // Disable line wrap

	foldcolumn = "1",
	foldlevel = 99,
	foldlevelstart = 99,
	foldenable = true,
}

for k, v in pairs(globals) do
	vim.g[k] = v
end

for k, v in pairs(opts) do
	vim.o[k] = v
end
