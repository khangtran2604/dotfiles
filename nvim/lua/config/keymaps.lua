local opts = { noremap = true, silent = true }

-- Delete without yanking
vim.keymap.set({ "v", "n" }, "x", '"_x', opts)

vim.keymap.set("i", "jk", "<esc>", opts)

-- general clear highlights
vim.keymap.set("n", "<ESC>", "<CMD>noh<CR>", opts)
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", opts)

-- Fast quit
vim.keymap.set("n", "<leader>q", "<cmd>confirm q<cr>", opts)
-- Fast quit all
vim.keymap.set("n", "<leader>Q", "<cmd>confirm qall<cr>", opts)

-- Vertical Split
vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<cr>", opts)

-- Horizontal Split
vim.keymap.set("n", "<leader>sh", "<cmd>split<cr>", opts)

-- Show Full File-Path
vim.keymap.set("n", "<leader>pa", ":echo expand('%:p')<cr>", opts)

-- Fast saving
vim.keymap.set({ "n", "s" }, "<leader>wf", "<cmd>w<cr><esc>", opts)

-- Keep cursor centered when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Remap for dealing with visual line wraps
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- paste over currently selected text without yanking it
vim.keymap.set("v", "p", '"0p')
vim.keymap.set("v", "P", '"0P')

-- copy everything between { and } including the brackets
-- p puts text after the cursor,
-- P puts text before the cursor.
-- vim.keymap.set("n", "YY", "va{Vy", opts)

-- Move line on the screen rather than by line in the file
vim.keymap.set("n", "j", "gj", opts)
vim.keymap.set("n", "k", "gk", opts)

-- Move to start/end of line
vim.keymap.set({ "n", "x", "o" }, "H", "^", opts)
vim.keymap.set({ "n", "x", "o" }, "L", "g_", opts)

-- Panes resizing
vim.keymap.set("n", "+", ":vertical resize +5<CR>")
vim.keymap.set("n", "_", ":vertical resize -5<CR>")
vim.keymap.set("n", "=", ":resize +5<CR>")
vim.keymap.set("n", "-", ":resize -5<CR>")

-- Map enter to ciw in normal mode
vim.keymap.set("n", "<CR>", "ciw", opts)
vim.keymap.set("n", "<BS>", "ci", opts)

vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)

-- Split line with X
vim.keymap.set("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", { silent = true })

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG", opts)

-- write file in current directory
-- :w %:h/<new-file-name>
vim.keymap.set("n", "<C-n>", ":w %:h/", opts)

-- delete forward
-- w{number}dw
-- delete backward
-- w{number}db

-- vim.keymap.set("n", "<C-P>", ':lua require("config.utils").toggle_go_test()<CR>', opts)

-- ctrl + x to cut full line
vim.keymap.set("n", "<C-x>", "dd", opts)

-- Switch between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })

-- Pane and Window Navigation
vim.keymap.set("t", "<C-h>", "wincmd h") -- Navigate Left
vim.keymap.set("t", "<C-j>", "wincmd j") -- Navigate Down
vim.keymap.set("t", "<C-k>", "wincmd k") -- Navigate Up
vim.keymap.set("t", "<C-l>", "wincmd l") -- Navigate Right

-- Tmux Navigator Support
vim.keymap.set("n", "<C-h>", vim.cmd.TmuxNavigateLeft, { desc = "Window left" })
vim.keymap.set("n", "<C-l>", vim.cmd.TmuxNavigateRight, { desc = "Window right" })
vim.keymap.set("n", "<C-j>", vim.cmd.TmuxNavigateDown, { desc = "Window down" })
vim.keymap.set("n", "<C-k>", vim.cmd.TmuxNavigateUp, { desc = "Window up" })
