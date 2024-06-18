-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<leader>wf", "<CMD>w<CR>", { desc = "Fast saving", silent = true })
map("n", "<leader>q", "<CMD>confirm q<CR>", { desc = "Fast quit with confirm", silent = true })
map("n", "<leader>Q", "<CMD>confirm qall<CR>", { desc = "Fast quit all with confirm", silent = true })

map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split vertical", silent = true })
map("n", "<leader>ss", "<cmd>split<CR>", { desc = "Split horizontal", silent = true })

map("n", "H", "^", { desc = "Move to start of line" })
map("n", "L", "g_", { desc = "Move to end of line" })

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

map("n", "+", "<CMD>vertical resize +5<CR>", { desc = "Increase vertical size +5", silent = true })
map("n", "_", "<CMD>vertical resize -5<CR>", { desc = "Decrease vertical size -5", silent = true })
map("n", "=", "<CMD>resize +5<CR>", { desc = "Increase horizontal size +5", silent = true })
map("n", "-", "<CMD>resize -5<CR>", { desc = "Decrease horizontal size +5", silent = true })

map("n", "<leader>ni", "magg}O", { desc = "New import" })
map("n", "<leader>pa", "<cmd>echo expand('%:p')<cr>", { desc = "Show full file path", silent = true })

map("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>", { desc = "Next tab", silent = true })
map("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>", { desc = "Prev tab", silent = true })
map("n", "<leader>X", "<CMD>BufferLineCloseOthers<CR>", { desc = "Close other tabs", silent = true })

map("n", "<leader>fn", "<CMD>NoicePick<CR>", { desc = "Find notifications", silent = true })

map("n", "<leader>mo", function()
  vim.t.bufs = vim.tbl_filter(function(bufnr)
    ---@diagnostic disable-next-line: deprecated
    return vim.api.nvim_buf_get_option(bufnr, "modified")
  end, vim.t.bufs)
end, { desc = "Modified buffers only" })

map("n", "<leader>ft", "<CMD>TodoTelescope<CR>", { desc = "Find todos" })
-- Illuminate

map("n", "]w", function()
  require("illuminate").goto_next_reference()
end, { desc = "Goto next reference" })
map("n", "[w", function()
  require("illuminate").goto_prev_reference()
end, { desc = "Goto previous reference" })

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

map("i", "jk", "<ESC>")

map("v", "c", '"_c', { desc = "Change without yanking" })
map("v", "x", '"_x', { desc = "Delete without yanking" })

map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move the selected code down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move the selected code up" })
