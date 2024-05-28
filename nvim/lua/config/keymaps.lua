local opts = { noremap = true, silent = true }
local map = vim.keymap.set

--------------------------------- BASE ----------------------------------

--> Normal Mode

-- Fast saving
map('n', '<leader>wf', '<CMD>w<CR>', opts)

-- Fast quit
map('n', '<leader>q', '<CMD>confirm q<CR>', opts)

-- Fast quit all
map('n', '<leader>Q', '<CMD>confirm qall<CR>', opts)

-- Split
map('n', '<leader>|', '<CMD>vsplit<CR>', opts)
map('n', '<leader>-', '<CMD>split<CR>', opts)

-- Keep cursor centered when scrolling
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)

-- Remap for dealing with visual line wraps
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Better window movement
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Pane and Window Navigation
vim.keymap.set("t", "<C-h>", "wincmd h") -- Navigate Left
vim.keymap.set("t", "<C-j>", "wincmd j") -- Navigate Down
vim.keymap.set("t", "<C-k>", "wincmd k") -- Navigate Up
vim.keymap.set("t", "<C-l>", "wincmd l") -- Navigate Right

-- NOTE: Move line on the screen rather than by line in the file
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)

-- NOTE: Panes resizing
map('n', '+', ':vertical resize +5<CR>')
map('n', '_', ':vertical resize -5<CR>')
map('n', '=', ':resize +5<CR>')
map('n', '-', ':resize -5<CR>')

-- NOTE: Map enter to ciw in normal mode
map('n', '<CR>', 'ciw', opts)
-- map('n', '<BS>', 'ci', opts)

--> Insert Mode

-- Exit on jk
map('i', 'jk', '<ESC>', opts)

--> Visual Mode

-- Move selected line / block of text in visual mode
map('v', 'J', ":m '>+1<CR>gv=gv", opts)
map('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- paste over currently selected text without yanking it
map('v', 'p', '"_dp')
map('v', 'P', '"_dP')

--> Multiple Modes

-- Move to start/end of line
map({ 'n', 'x', 'o' }, 'H', '^', opts)
map({ 'n', 'x', 'o' }, 'L', 'g_', opts)

--------------------------------- PLUGINS ----------------------------------

--> Tmux Navigator

-- Tmux Navigator Support
vim.keymap.set("n", "<C-h>", vim.cmd.TmuxNavigateLeft, { desc = "Window left" })
vim.keymap.set("n", "<C-l>", vim.cmd.TmuxNavigateRight, { desc = "Window right" })
vim.keymap.set("n", "<C-j>", vim.cmd.TmuxNavigateDown, { desc = "Window down" })
vim.keymap.set("n", "<C-k>", vim.cmd.TmuxNavigateUp, { desc = "Window up" })

--> Telescope

-- Find
map("n", "<leader>ff", '<CMD>lua require("telescope.builtin").find_files()<CR>', { desc = "Find files" })
map("n", "<leader>fa", function()
  require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
end, { desc = "Find All Files" })
map("n", "<leader>fW", function()
  require("telescope.builtin").live_grep({
    additional_args = function(args)
      return vim.list_extend(args, { "--hidden", "--no-ignore" })
    end,
  })
end, { desc = "Find words in all files" })
map("n", "<leader>fg", '<CMD>lua require("telescope.builtin").git_files()<CR>', { desc = "Find git files" })
map("n", "<leader>fw", '<CMD>lua require("telescope.builtin").live_grep()<CR>', { desc = "Find by grep" })
map("n", "<leader>fb", '<CMD>lua require("telescope.builtin").buffers()<CR>', { desc = "Find existing buffers" })
map("n", "<leader>fh", '<CMD>lua require("telescope.builtin").help_tags()<CR>', { desc = "Find help" })
map("n", "<leader>fo", '<CMD>lua require("telescope.builtin").help_tags()<CR>', { desc = "Find old files" })
map("n", "<leader>fd", '<CMD>lua require("telescope.builtin").diagnostics()<CR>', { desc = "Find Diagnostics" })
map("n", "<leader>fT", function()
  require("telescope.builtin").colorscheme({ enable_preview = true })
end, { desc = "Find Theme" })

-- Goto
-- map("n", "gd", '<CMD>lua require("telescope.builtin").lsp_definitions()<CR>', { desc = "[G]oto [D]efinition" })
-- map("n", "gr", '<CMD>lua require("telescope.builtin").lsp_references()<CR>', { desc = "[G]oto [R]eferences" })
-- map("n", "gI", '<CMD>lua require("telescope.builtin").lsp_implementations()<CR>', { desc = "[G]oto [I]mplementation" })

-- List
-- map("n", "<leader>ls", '<CMD>lua require("telescope.builtin").lsp_document_symbols()<CR>', { desc = "[L]ist document symbols" })

-- Others
map("n", "<leader>?", '<CMD>lua require("telescope.builtin").builtin()<CR>', { desc = "[S]earch [S]elect Telescope" })
map("n", "<leader>;", '<CMD>lua require("telescope.builtin").resume()<CR>', { desc = "[F]ind [R]esume" })
map("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "Fuzzily find in current buffer" })

--> Todo Comment
map("n", "<leader>ft", "<Cmd>TodoTelescope<CR>", { desc = "Find Todos" })
