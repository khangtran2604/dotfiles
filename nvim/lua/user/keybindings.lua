local map = require("core.utils.utils").map

-- Escape insert mode
map("i", "jk", "<ESC>")

-- general clear highlights
map("n", "<ESC>", "<CMD>noh<CR>")
map({ "n", "v" }, "<Space>", "<Nop>")

-- Delete without yanking
map({ "v", "n" }, "x", '"_x', { desc = "Delete without yanking" })

-- Fast saving
map({ "n", "s" }, "<leader>wf", "<cmd>w<cr><esc>", { desc = "Fast saving", silent = true })

-- Fast quit
map("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Fast quit", silent = true })
-- Fast quit all
map("n", "<leader>Q", "<cmd>confirm qall<cr>", { desc = "Fast quit all", silent = true })

-- Split
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Vertical", silent = true, noremap = true })
map("n", "<leader>sh", "<cmd>split<cr>", { desc = "Horizontal", silent = true, noremap = true })

-- Show Full File-Path
map("n", "<leader>pa", ":echo expand('%:p')<cr>", { desc = "Show full file path", silent = true })

-- Keep cursor centered when scrolling up/down
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Move to start/end of line
map("n", "H", "^", { desc = "Move to start of line", noremap = true, silent = true })
map("n", "L", "g_", { desc = "Move to end of line", noremap = true, silent = true })

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

-- NOTE: Panes resizing
map("n", "+", ":vertical resize +2<CR>", { desc = "Increase vertical size +5", silent = true })
map("n", "_", ":vertical resize -2<CR>", { desc = "Decrease vertical size -5", silent = true })
map("n", "=", ":resize +2<CR>", { desc = "Increase horizontal size +5", silent = true })
map("n", "-", ":resize -2<CR>", { desc = "Decrease horizontal size -5", silent = true })

-- Telescope
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Telescope Find Files" })
map("n", "<leader>fg", "<CMD>Telescope git_files hidden=true<CR>", { desc = "Telescope Git Files" })
map("n", "<leader>fw", "<CMD>Telescope live_grep<CR>")
map("n", "<leader>fW", "<CMD>Telescope live_grep hidden=true no_ignore=true<CR>")
map("n", "<leader><space>", "<CMD>Telescope buffers<CR>")
map("n", "<leader>fh", "<CMD>Telescope help_tags<CR>")
map(
	"n",
	"<leader>fa",
	"<CMD>Telescope find_files no_ignore=true hidden=true<CR>",
	{ desc = "Telescope Find All Files" }
)
map("n", "<leader>/", "<CMD>Telescope live_grep search_dirs='%:p'<CR>", { desc = "Fuzzily find in current buffer" })
map("n", "<leader>fd", "<CMD>Telescope diagnostics<CR>", { desc = "Find Diagnostics" })
map("n", "<leader>;", "<CMD>Telescope resume<CR>", { desc = "Find Resume" })
map(
	"n",
	"<leader>fc",
	"<CMD>Telescope find_files cwd=" .. vim.fn.stdpath("config") .. "<CR>",
	{ desc = "[F]ind [N]eovim files" }
)
map("n", "<leader>fk", "<CMD>Telescope keymaps<CR>", { desc = "[F]ind [K]eymaps" })
map("n", "<leader>ls", "<CMD>Telescope lsp_document_symbols<CR>", { desc = "[D]ocument [S]ymbols" })
map("n", "<leader>fn", "<CMD>Telescope noice<CR>", { desc = "[List] Noices" })

-- Neotree
map("n", "<leader>e", "<CMD>Neotree<CR>")

-- Bufferline
map("n", "<Tab>", "<CMD>BufferLineCycleNext<CR>", { desc = "Bufferline next buffer" })
map("n", "<S-Tab>", "<CMD>BufferLineCyclePrev<CR>", { desc = "Bufferline prev buffer" })
map("n", "<leader>X", "<CMD>BufferLineCloseOthers<CR>", { desc = "Close other buffers" })

-- LSP
map("n", "<leader>co", function()
	vim.lsp.buf.code_action({
		apply = true,
		context = {
			only = { "source.organizeImports.ts" },
			diagnostics = {},
		},
	})
end, { desc = "Organize Imports" })

map("n", "<leader>rm", function()
	vim.lsp.buf.code_action({
		apply = true,
		context = {
			only = { "source.removeUnused.ts" },
			diagnostics = {},
		},
	})
end, { desc = "Remove Unused Imports" })
