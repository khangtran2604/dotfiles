require "nvchad.mappings"

-- Disable mappings
local nomap = vim.keymap.del

nomap("n", "<leader>ma")
nomap("n", "<leader>pt")
nomap("n", "<leader>/")
nomap("n", "<leader>gt")
nomap("n", "<leader>ds")
nomap("n", "<leader>rn")
nomap("n", "<leader>n")
nomap("n", "<leader>fb")

local opts = { noremap = true, silent = true }
-- add yours here

local map = vim.keymap.set

map({ "v", "n" }, "x", '"_x', { desc = "Delete without yanking" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>wf", ":w")

-- Fast quit
map("n", "<leader>q", "<cmd>confirm q<cr>", opts)
-- Fast quit all
map("n", "<leader>Q", "<cmd>confirm qall<cr>", opts)
-- Vertical Split
map("n", "<leader>sv", "<cmd>vsplit<cr>", opts)
-- Horizontal Split
map("n", "<leader>sh", "<cmd>split<cr>", opts)
-- Show Full File-Path
map("n", "<leader>pa", ":echo expand('%:p')<cr>", opts)
-- Fast saving
map({ "n", "s" }, "<leader>wf", "<cmd>w<cr><esc>", opts)
-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")
-- paste over currently selected text without yanking it
-- map("v", "p", '"0p')
-- map("v", "P", '"0P')
-- Move to start/end of line
map({ "n", "x", "o" }, "H", "^", opts)
map({ "n", "x", "o" }, "L", "g_", opts)
-- Panes resizing
map("n", "+", ":vertical resize +5<CR>")
map("n", "_", ":vertical resize -5<CR>")
map("n", "=", ":resize +5<CR>")
map("n", "-", ":resize -5<CR>")
-- Switch between windows
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
-- Pane and Window Navigation
map("t", "<C-h>", "wincmd h") -- Navigate Left
map("t", "<C-j>", "wincmd j") -- Navigate Down
map("t", "<C-k>", "wincmd k") -- Navigate Up
map("t", "<C-l>", "wincmd l") -- Navigate Right
-- Tmux Navigator Support
map("n", "<C-h>", vim.cmd.TmuxNavigateLeft, { desc = "Window left" })
map("n", "<C-l>", vim.cmd.TmuxNavigateRight, { desc = "Window right" })
map("n", "<C-j>", vim.cmd.TmuxNavigateDown, { desc = "Window down" })
map("n", "<C-k>", vim.cmd.TmuxNavigateUp, { desc = "Window up" })
-- Telescope
map("n", "<leader>;", function()
  require("telescope.builtin").resume()
end, { desc = "Resume last search" })
map("n", "<leader><space>", function()
  require("telescope.builtin").buffers()
end, { desc = "Find buffers" })
map("n", "<leader>fn", ":NoiceTelescope<CR>", opts)
-- Oraginize Imports
map("n", "<leader>co", function()
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      ---@diagnostic disable-next-line: assign-type-mismatch
      only = { "source.organizeImports.ts" },
      diagnostics = {},
    },
  }
end, { desc = "Organize Imports" })
-- Remove Unused Imports
map("n", "<leader>rm", function()
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      ---@diagnostic disable-next-line: assign-type-mismatch
      only = { "source.removeUnused.ts" },
      diagnostics = {},
    },
  }
end, { desc = "Remove Unused Imports" })
