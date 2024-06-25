---@diagnostic disable: undefined-global, assign-type-mismatch
local map = vim.keymap.set

-- Delete without yanking
-- map("v", "c", '"_c', { desc = "Change without yanking" })
map({ 'v', 'n' }, 'x', '"_x', { desc = 'Delete without yanking' })

-- general clear highlights
map('n', '<ESC>', '<CMD>noh<CR>', { silent = true })
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- better up/down
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

-- Fast saving
map('n', '<leader>wf', ':w<cr>', { desc = 'Fast saving', silent = true, noremap = true })

-- Fast quit
map('n', '<leader>q', '<cmd>confirm q<cr>', { desc = 'Fast quit', silent = true })
-- Fast quit all
map('n', '<leader>Q', '<cmd>confirm qall<cr>', { desc = 'Fast quit all', silent = true })

-- Split
map('n', '<leader>sv', '<cmd>vsplit<cr>', { desc = 'Vertical', silent = true, noremap = true })
map('n', '<leader>sh', '<cmd>split<cr>', { desc = 'Horizontal', silent = true, noremap = true })

-- Show Full File-Path
map('n', '<leader>pa', ":echo expand('%:p')<cr>", { desc = 'Show full file path', silent = true })

-- Indenting
map('v', '<', '<gv', { silent = true, noremap = true })
map('v', '>', '>gv', { silent = true, noremap = true })

-- Keep cursor centered when scrolling up/down
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Move to start/end of line
map('n', 'H', '^', { desc = 'Move to start of line', noremap = true, silent = true })
map('n', 'L', 'g_', { desc = 'Move to end of line', noremap = true, silent = true })

-- Move selected line / block of text up/down in visual mode
map(
  'v',
  'J',
  ":m '>+1<CR>gv=gv",
  { desc = 'Move selected line / block of text down in visual mode', noremap = true, silent = true }
)
map(
  'v',
  'K',
  ":m '<-2<CR>gv=gv",
  { desc = 'Move selected line / block of text up in visual mode', noremap = true, silent = true }
)

map('n', '<leader>co', function()
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      only = { 'source.organizeImports.ts' },
      diagnostics = {},
    },
  }
end, { desc = 'Organize Imports' })

map('n', '<leader>rm', function()
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      only = { 'source.removeUnused.ts' },
      diagnostics = {},
    },
  }
end, { desc = 'Remove Unused Imports' })

-- Switch between windows
map('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
map('n', '<C-l>', '<C-w>l', { desc = 'Window right' })
map('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
map('n', '<C-k>', '<C-w>k', { desc = 'Window up' })

-- Tmux Navigator Support
map('n', '<C-h>', vim.cmd.TmuxNavigateLeft, { desc = 'Window left' })
map('n', '<C-l>', vim.cmd.TmuxNavigateRight, { desc = 'Window right' })
map('n', '<C-j>', vim.cmd.TmuxNavigateDown, { desc = 'Window down' })
map('n', '<C-k>', vim.cmd.TmuxNavigateUp, { desc = 'Window up' })

-- Pane and Window Navigation
map('t', '<C-h>', 'wincmd h') -- Navigate Left
map('t', '<C-j>', 'wincmd j') -- Navigate Down
map('t', '<C-k>', 'wincmd k') -- Navigate Up
map('t', '<C-l>', 'wincmd l') -- Navigate Right

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

-- NOTE: Panes resizing
map('n', '+', ':vertical resize +2<CR>', { desc = 'Increase vertical size +5', silent = true })
map('n', '_', ':vertical resize -2<CR>', { desc = 'Decrease vertical size -5', silent = true })
map('n', '=', ':resize +2<CR>', { desc = 'Increase horizontal size +5', silent = true })
map('n', '-', ':resize -2<CR>', { desc = 'Decrease horizontal size -5', silent = true })
