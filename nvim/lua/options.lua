-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
local g = vim.g

-- Set highlight on search
vim.o.stausline = 'Filename:%t\\ Line:\\ %l\\ Col:\\ %c'

-- Set highlight on search
vim.o.hlsearch = true

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

-- Configuration for Neovide

if g.neovide then
  g.neovide_transparency = 0.9
  g.neovide_window_blurred = true
  g.neovide_refresh_rate = 144
  g.neovide_cursor_vfx_mode = 'ripple'
  g.neovide_cursor_animation_length = 0.02
  g.neovide_cursor_trail_size = 0.9
  g.neovide_remember_window_size = true
end

-- NOTE: EXPEREMENTAL: This is a new feature and may not work as expected
vim.o.smartindent = true -- make indenting smarter again
vim.o.swapfile = false -- creates a swapfile
vim.o.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.o.updatetime = 100 -- faster completion (4000ms default)
vim.o.expandtab = true -- convert tabs to spaces
vim.o.shiftwidth = 2 -- the number of spaces inserted for each indentation
vim.o.tabstop = 2 -- insert 2 spaces for a tab

vim.cmd 'set whichwrap+=<,>,[,],h,l'
vim.cmd [[set iskeyword+=-]]

-- In summary, this configuration snippet sets up an autocommand that automatically checks if the current file has been changed by another program every time you switch into a buffer window in Neovim. If there are external changes, it alerts you, ensuring that you're always working with the most up-to-date version of the file
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  pattern = { '*' },
  callback = function()
    vim.cmd 'checktime'
  end,
})

-- Overall, this autocommand automates interaction with snippets from luasnip based on cursor behavior, contributing to a smoother and more intuitive editing experience in Neovim.
vim.api.nvim_create_autocmd({ 'CursorHold' }, {
  callback = function()
    local status_ok, luasnip = pcall(require, 'luasnip')
    if not status_ok then
      return
    end
    if luasnip.expand_or_jumpable() then
      -- ask maintainer for option to make this silent
      -- luasnip.unlink_current()
      vim.cmd [[silent! lua require("luasnip").unlink_current()]]
    end
  end,
})

-- vim: ts=2 sts=2 sw=2 et
