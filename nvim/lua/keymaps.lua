-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Clear highlights
vim.keymap.set('n', '<esc>', '<cmd>noh<cr>', { desc = 'Clear highlights' })

-- Delete without yank
vim.keymap.set({ 'n', 'v' }, '<leader>dd', [["_d]], { desc = 'Delete without yanking' })

-- Fast escape
vim.keymap.set('i', 'jj', '<esc>')
vim.keymap.set('i', 'jk', '<esc>')
-- Fast saving
vim.keymap.set('n', '<leader>wf', '<cmd>w<cr>', { desc = 'Fast saving', silent = true, noremap = true })
-- Fast quit
vim.keymap.set('n', '<leader>q', '<cmd>confirm q<cr>', { desc = 'Fast quit' })
-- Fast quit all
vim.keymap.set('n', '<leader>Q', '<cmd>confirm qall<cr>', { desc = 'Fast quit all' })
-- Fast new file
vim.keymap.set('n', '<leader>nf', '<cmd>enew<cr>', { desc = 'New file' })
-- Split
vim.keymap.set('n', '<leader>sv', '<cmd>vsplit<cr>', { desc = 'Vertical split' })
vim.keymap.set('n', '<leader>sh', '<cmd>split<cr>', { desc = 'Horizontal split' })
-- Replace all in current file
vim.keymap.set('n', '<leader>ra', 'ggVG:s/')
-- Show Full File-Path
vim.keymap.set('n', '<leader>pa', "echo expand('%:p')") -- Show Full File Path
-- Indenting
vim.keymap.set('v', '<', '<gv', { silent = true, noremap = true })
vim.keymap.set('v', '>', '>gv', { silent = true, noremap = true })
-- Replace all selected
vim.keymap.set('v', '<leader>ra', '"hy :%s/<C-r>h/', { desc = 'Relace all with selected paragraph' })

-- Keep cursor centered when scrolling up/down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- Move to start/end of line
vim.keymap.set('n', 'H', '^', { desc = 'Move to start of line', noremap = true, silent = true })
vim.keymap.set('n', 'L', 'g_', { desc = 'Move to end of line', noremap = true, silent = true })
-- Move selected line / block of text up/down in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected line / block of text down in visual mode', noremap = true, silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selected line / block of text up in visual mode', noremap = true, silent = true })
-- paste over currently selected text without yanking it
vim.keymap.set('v', 'p', '"_dp', { noremap = true, silent = true })
vim.keymap.set('v', 'P', '"_dP', { noremap = true, silent = true })

-- Switch between windows
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Window left' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Window right' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Window down' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Window up' })

-- Tmux Navigator Support
vim.keymap.set('n', '<C-h>', vim.cmd.TmuxNavigateLeft, { desc = 'Window left' })
vim.keymap.set('n', '<C-l>', vim.cmd.TmuxNavigateRight, { desc = 'Window right' })
vim.keymap.set('n', '<C-j>', vim.cmd.TmuxNavigateDown, { desc = 'Window down' })
vim.keymap.set('n', '<C-k>', vim.cmd.TmuxNavigateUp, { desc = 'Window up' })

-- Pane and Window Navigation
-- vim.keymap.set('n', '<C-h>', '<C-w>h') -- Navigate Left
-- vim.keymap.set('n', '<C-j>', '<C-w>j') -- Navigate Down
-- vim.keymap.set('n', '<C-k>', '<C-w>k') -- Navigate Up
-- vim.keymap.set('n', '<C-l>', '<C-w>l') -- Navigate Right
vim.keymap.set('t', '<C-h>', 'wincmd h') -- Navigate Left
vim.keymap.set('t', '<C-j>', 'wincmd j') -- Navigate Down
vim.keymap.set('t', '<C-k>', 'wincmd k') -- Navigate Up
vim.keymap.set('t', '<C-l>', 'wincmd l') -- Navigate Right
-- vim.keymap.set('n', '<C-h>', 'TmuxNavigateLeft') -- Navigate Left
-- vim.keymap.set('n', '<C-j>', 'TmuxNavigateDown') -- Navigate Down
-- vim.keymap.set('n', '<C-k>', 'TmuxNavigateUp') -- Navigate Up
-- vim.keymap.set('n', '<C-l>', 'TmuxNavigateRight') -- Navigate Right

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

-- Navigate within insert mode
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-l>', '<Right>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')

-- Neotree
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', { desc = 'Toggle Neotree' })
vim.keymap.set('n', '<leader>o', '<Cmd>Neotree focus<CR>', { desc = 'Focus NeoTree' })

-- Illuminate
vim.keymap.set('n', ']w', function()
  require('illuminate').goto_next_reference()
end, { desc = 'Goto next reference' })
vim.keymap.set('n', '[w', function()
  require('illuminate').goto_next_reference()
end, { desc = 'Goto previous reference' })

-- Todo Comments
vim.keymap.set('n', '<leader>ft', '<Cmd>TodoTelescope<CR>', { desc = '[F]ind Todos' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- vim: ts=2 sts=2 sw=2 et
