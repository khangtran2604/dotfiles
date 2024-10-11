-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<leader>l")
vim.keymap.del("n", "<C-s>")
vim.keymap.del("n", "<leader>bd")
vim.keymap.del("n", "<leader>w")
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>|")
local map = require("config.core.utils").map

-- delete without yanking
map({ "v", "n" }, "x", '"_x')
-- fast escape
map("i", "jk", "<ESC>")
-- general clear highlights
map("n", "<ESC>", "<CMD>noh<CR>")
map({ "n", "v" }, "<Space>", "<Nop>")
-- Fast saving
-- map({ "n", "s" }, "<leader>wf", "<cmd>w!<cr>")
map({ "i", "x", "n", "s" }, "<leader>wf", "<cmd>w<cr><esc>", { desc = "Save File", silent = true })
-- Fast quit
map("n", "<leader>q", "<cmd>confirm q<cr>")
-- Fast quit all
map("n", "<leader>Q", "<cmd>confirm qall<cr>")
-- Split Vertical
map("n", "<leader>sv", "<cmd>vsplit<cr>")
-- Split Horizontal
map("n", "<leader>sh", "<cmd>split<cr>")
-- Show Full File-Path
map("n", "<leader>pa", ":echo expand('%:p')<cr>")
-- Indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
-- Keep cursor centered when scrolling up/down
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- Move to start/end of line
map("n", "H", "^")
map("n", "L", "g_")
-- Move selected line / block of text up/down in visual mode
map(
  "v",
  "J",
  ":m '>+1<CR>gv=gv",
  { desc = "Move selected line / block of text down in visual mode", noremap = true, silent = true }
)
map(
  "v",
  "K",
  ":m '<-2<CR>gv=gv",
  { desc = "Move selected line / block of text up in visual mode", noremap = true, silent = true }
)
-- Increase panel size
map("n", "=", ":vertical resize +2<CR>", { desc = "Increase vertical size +2", silent = true })
map("n", "-", ":vertical resize -2<CR>", { desc = "Decrease vertical size -2", silent = true })
-- Switch between windows
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })

-- Tmux Navigator Support
map("n", "<C-h>", vim.cmd.TmuxNavigateLeft, { desc = "Window left" })
map("n", "<C-l>", vim.cmd.TmuxNavigateRight, { desc = "Window right" })
map("n", "<C-j>", vim.cmd.TmuxNavigateDown, { desc = "Window down" })
map("n", "<C-k>", vim.cmd.TmuxNavigateUp, { desc = "Window up" })

-- Pane and Window Navigation
map("t", "<C-h>", "wincmd h") -- Navigate Left
map("t", "<C-j>", "wincmd j") -- Navigate Down
map("t", "<C-k>", "wincmd k") -- Navigate Up
map("t", "<C-l>", "wincmd l") -- Navigate Right

-- Telescope
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
map("n", "<leader>fg", "<CMD>Telescope git_files hidden=true<CR>")
map("n", "<leader>fw", "<CMD>Telescope live_grep<CR>")
map("n", "<leader>fW", "<CMD>Telescope live_grep hidden=true no_ignore=true<CR>")
map("n", "<leader>fh", "<CMD>Telescope help_tags<CR>")
map("n", "<leader>fa", "<CMD>Telescope find_files no_ignore=true hidden=true<CR>")
-- map("n", "<leader>/", "<CMD>Telescope live_grep search_dirs='%:p'<CR>")
map("n", "<leader>fd", "<CMD>Telescope diagnostics<CR>")
map("n", "<leader>;", "<CMD>Telescope resume<CR>")
map("n", "<leader>fc", "<CMD>Telescope find_files cwd=" .. vim.fn.stdpath("config") .. "<CR>")
map("n", "<leader>fk", "<CMD>Telescope keymaps<CR>")
-- map("n", "<leader>ls", "<CMD>Telescope lsp_document_symbols<CR>")
map("n", "<leader>fn", "<CMD>Telescope noice<CR>")
map("n", "<leader>fp", "<CMD>Telescope projects<CR>")

-- Neotree
map("n", "<leader>e", "<CMD>Neotree<CR>")

-- Bufferline
map("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>")
map("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>")
map("n", "<leader>X", "<CMD>BufferLineCloseOthers<CR>")
map("n", "<leader>x", LazyVim.ui.bufremove, { desc = "Delete Buffer" })

-- Zenmode
map("n", "<leader>zm", "<CMD>ZenMode<CR>")
