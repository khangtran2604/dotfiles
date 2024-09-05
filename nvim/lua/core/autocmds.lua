local augroup = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd

-- Highlight when yanking
cmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- don't auto comment new line
cmd('BufEnter', { command = [[set formatoptions-=cro]] })

-- Fixes some bugs with how treesitter manages folds
cmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
  desc = "fix tree sitter folds issue",
  group = augroup("treesitter folds", { clear = true }),
  pattern = { "*" },
  callback = function()
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  end,
})

-- Removes any trailing whitespace when saving a file
cmd({ "BufWritePre" }, {
  desc = "remove trailing whitespace on save",
  group = augroup("remove trailing whitespace", { clear = true }),
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- remembers file state, such as cursor position and any folds
augroup("remember file state", { clear = true })
cmd({ "BufWinLeave" }, {
  desc = "remember file state",
  group = "remember file state",
  pattern = { "*.*" },
  command = "mkview",
})
cmd({ "BufWinEnter" }, {
  desc = "remember file state",
  group = "remember file state",
  pattern = { "*.*" },
  command = "silent! loadview",
})

-- fixes Trouble not closing when last window in tab
cmd("BufEnter", {
	group = vim.api.nvim_create_augroup("TroubleClose", { clear = true }),
	callback = function()
		local layout = vim.api.nvim_call_function("winlayout", {})
		if
			layout[1] == "leaf"
			and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "Trouble"
			and layout[3] == nil
		then
			vim.cmd("confirm quit")
		end
	end,
})

-- Fix conceallevel for json files
cmd({ 'FileType' }, {
  group = augroup('json_conceal', {clear = true}),
  pattern = { 'json', 'jsonc', 'json5' },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

-- close some filetypes with <q>
cmd('FileType', {
  group = augroup('close_with_q', {clear = true}),
  pattern = {
    'PlenaryTestPopup',
    'help',
    'lspinfo',
    'notify',
    'qf',
    'spectre_panel',
    'startuptime',
    'tsplayground',
    'neotest-output',
    'checkhealth',
    'neotest-summary',
    'neotest-output-panel',
    'dbout',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

-- Show cursor line only in active window
cmd({ 'InsertLeave', 'WinEnter' }, {
  group = augroup('auto_cursorline_show', {clear = true}),
  callback = function(event)
    if vim.bo[event.buf].buftype == '' then
      vim.opt_local.cursorline = true
    end
  end,
})
cmd({ 'InsertEnter', 'WinLeave' }, {
  group = augroup('auto_cursorline_hide', {clear = true}),
  callback = function()
    vim.opt_local.cursorline = false
  end,
})

-- Resize splits if window got resized
cmd({ 'VimResized' }, {
  group = augroup('resize_splits', {clear = true}),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd 'tabdo wincmd ='
    vim.cmd('tabnext ' .. current_tab)
  end,
})
