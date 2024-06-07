require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Normal Mode

map("n", "<leader>wf", "<CMD>w<CR>", { desc = "Fast saving" })
map("n", "<leader>q", "<CMD>confirm q<CR>", { desc = "Fast quit with confirm" })
map("n", "<leader>Q", "<CMD>confirm qall<CR>", { desc = "Fast quit all with confirm" })

map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split vertical" })
map("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split horizontal" })

map("n", "H", "^", { desc = "Move to start of line" })
map("n", "L", "g_", { desc = "Move to end of line" })

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

map("n", "+", "<CMD>vertical resize +5<CR>", { desc = "Increase vertical size +5" })
map("n", "_", "<CMD>vertical resize -5<CR>", { desc = "Decrease vertical size -5" })
map("n", "=", "<CMD>resize +5<CR>", { desc = "Increase horizontal size +5" })
map("n", "-", "<CMD>resize -5<CR>", { desc = "Decrease horizontal size +5" })

map("n", "<leader>ni", "magg}O", { desc = "New import" })

-- Insert Mode

map("i", "jk", "<ESC>")

-- Visual Mode

map("v", "c", '"_c', { desc = "Change without yanking" })
map("v", "x", '"_x', { desc = "Delete without yanking" })

map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move the selected code down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move the selected code up" })

-- Telescope
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Telescope diagnostics" })
map("n", "<leader>;", "<cmd>Telescope resume<CR>", { desc = "Telescope resume" })
map("n", "<leader><space>", "<cmd>Telescope buffers<CR>", { desc = "Telescope buffers" })
map("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "Telescope document symbols" })

-- HopChar2
map("n", "<leader>j", "<cmd>HopChar2<CR>", { desc = "Jump to anywhere by 2 characters" })

-- Todo Comments
map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find todos" })

-- Illuminate
map("n", "]w", function()
  require("illuminate").goto_next_reference()
end, { desc = "Goto next reference" })
map("n", "[w", function()
  require("illuminate").goto_prev_reference()
end, { desc = "Goto previous reference" })

-- Harpoon
map("n", "<leader>ha", function()
  require("harpoon"):list():add()
end, { desc = "Add to Harpoon list" })

map("n", "<leader>hl", function()
  require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, { desc = "Show Harpoon list" })

map("n", "<leader>h1", function()
  require("harpoon"):list():select(1)
end, { desc = "Select 1st item" })

map("n", "<leader>h2", function()
  require("harpoon"):list():select(2)
end, { desc = "Select 2nd item" })

map("n", "<leader>h3", function()
  require("harpoon"):list():select(3)
end, { desc = "Select 3rd item" })

map("n", "<leader>h4", function()
  require("harpoon"):list():select(4)
end, { desc = "Select 4th item" })

map("n", "<leader>h5", function()
  require("harpoon"):list():select(5)
end, { desc = "Select 5th item" })

-- Gitsigns
map({ "n", "v" }, "]e", "<CMD>Gitsigns next_hunk<CR>", { desc = "Next hunk" })
map({ "n", "v" }, "[e", "<CMD>Gitsigns prev_hunk<CR>", { desc = "Previous hunk" })
map("n", "<leader>gs", "<CMD>Gitsigns stage_hunk<CR>", { desc = "Stage hunk" })
map("n", "<leader>gr", "<CMD>Gitsigns reset_hunk<CR>", { desc = "Reset hunk" })
map("n", "<leader>gS", "<CMD>Gitsigns stage_buffer<CR>", { desc = "Stage buffer" })
map("n", "<leader>gR", "<CMD>Gitsigns reset_buffer<CR>", { desc = "Reset buffer" })
map("n", "<leader>gp", "<CMD>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
map("n", "<leader>gb", "<CMD>Gitsigns blame_line<CR>", { desc = "Blame line" })
map("n", "<leader>gd", "<CMD>Gitsigns diffthis<CR>", { desc = "Git diff" })
map("n", "<leader>Tgb", "<CMD>Gitsigns toggle_current_line_blame<CR>", { desc = "Git toggle current line blame" })

-- Lazy Git
map("n", "<leader>gl", "<CMD>LazyGit<CR>", { desc = "Open LazyGit" })

-- Spectre
map("n", "<leader>sp", "<CMD>Spectre<CR>", { desc = "Open Spectre" })

-- LSP typescript
map("n", "<leader>co", function()
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      only = {
        "source.organizeImports.ts",
        -- "source.removeUnused.ts",
        -- "source.removeUnusedImports.ts",
        -- "source.addMissingImports.ts",
        -- "source.sortImports.ts",
        -- "source.fixAll.ts",
      },
      diagnostics = {},
    },
  }
end, { desc = "Code organize imports" })

map("n", "<leader>rm", function()
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      only = {
        -- "source.organizeImports.ts",
        "source.removeUnused.ts",
        -- "source.removeUnusedImports.ts",
        -- "source.addMissingImports.ts",
        -- "source.sortImports.ts",
        -- "source.fixAll.ts",
      },
      diagnostics = {},
    },
  }
end, { desc = "Code organize imports" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
-- Disable mappings
local nomap = vim.keymap.del

nomap("n", "<C-n>")
nomap("n", "<leader>n")
