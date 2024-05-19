vim.g.have_nerd_font = true

-- Set highlight on search
vim.o.hlsearch = true

-- Set highlight on search
-- vim.o.statusline = 'Filename:%t\\ Line:\\ %l\\ Col:\\ %c'

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.scrolloff = 10

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.o.spell = true
vim.o.spelllang = 'en'

-- NOTE: EXPEREMENTAL: This is a new feature and may not work as expected
vim.o.smartindent = true -- make indenting smarter again
vim.o.swapfile = false   -- creates a swapfile
vim.o.timeoutlen = 1000  -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.updatetime = 100   -- faster completion (4000ms default)
vim.o.expandtab = true   -- convert tabs to spaces
vim.o.shiftwidth = 2     -- the number of spaces inserted for each indentation
vim.o.tabstop = 2        -- insert 2 spaces for a tab

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true
