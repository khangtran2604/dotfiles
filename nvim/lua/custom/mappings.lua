local map = function(mode, key, result)
  vim.keymap.set(mode, key, result, { noremap = true, silent = true })
end
-- delete without yanking
map({ "v", "n" }, "x", '"_x')
-- fast escape
map("i", "jk", "<ESC>")
-- general clear highlights
map("n", "<ESC>", "<CMD>noh<CR>")
map({ "n", "v" }, "<Space>", "<Nop>")
-- Fast saving
map({ "n", "s" }, "<leader>wf", "<cmd>w<cr><esc>")
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

-- Pane and Window Navigation
map("t", "<C-h>", "wincmd h") -- Navigate Left
map("t", "<C-j>", "wincmd j") -- Navigate Down
map("t", "<C-k>", "wincmd k") -- Navigate Up
map("t", "<C-l>", "wincmd l") -- Navigate Right

-- Neotree
map("n", "<leader>e", "<CMD>Neotree<CR>")

-- Bufferline
map("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>")
map("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>")
map("n", "<leader>X", "<CMD>BufferLineCloseOthers<CR>")
map("n", "<leader>x", function()
  require("bufdelete").bufdelete(0, true)
end)

-- Zenmode
map("n", "<leader>zm", "<CMD>ZenMode<CR>")
map("n", "<leader>rn", function()
  vim.lsp.buf.rename()
end)
