-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight_on_yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Create an augroup for remembering fold states
local remember_folds_group = vim.api.nvim_create_augroup('remember_folds', { clear = true })

-- Autocommand to save the view (including folds) when leaving a buffer
vim.api.nvim_create_autocmd('BufWinLeave', {
  group = remember_folds_group,
  pattern = '?*',
  command = 'mkview 1',
})

-- Autocommand to load the view (including folds) when entering a buffer
vim.api.nvim_create_autocmd('BufWinEnter', {
  group = remember_folds_group,
  pattern = '?*',
  command = 'silent! loadview 1',
})

-- go to last loc when opening a buffer
-- this mean that when you open a file, you will be at the last position
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Create an augroup for equalizing windows on Vim resize
local equalize_windows_on_resize_group = vim.api.nvim_create_augroup('equalize_windows_on_resize', { clear = true })

-- Autocommand to equalize window sizes when Vim is resized
vim.api.nvim_create_autocmd('VimResized', {
  group = equalize_windows_on_resize_group,
  pattern = '*',
  command = 'exec "normal \\<c-w>="',
})

vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9
vim.g.floaterm_title = '($1/$2)'

local api = vim.api

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup('CursorLine', { clear = true })
api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
  pattern = '*',
  command = 'set cursorline',
  group = cursorGrp,
})
api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, { pattern = '*', command = 'set nocursorline', group = cursorGrp })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'apache',
  callback = function()
    vim.opt_local.commentstring = '#\\ %s'
  end,
})

-- don't auto comment new line
vim.api.nvim_create_autocmd('BufEnter', { command = [[set formatoptions-=cro]] })
