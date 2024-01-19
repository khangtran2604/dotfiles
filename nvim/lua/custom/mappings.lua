local M = {}

local opts = { noremap = true, silent = true }

M.abc = {
  n = {
    ["<C-d>"] = { "<C-d>zz", "Keep cursor centered when scrolling down", opts },
    ["<C-u>"] = { "<C-u>zz", "Keep cursor centered when scrolling up", opts },

    ["k"] = { "v:count == 0 ? 'gk' : 'k'", "Remap for dealing with visual line wraps", opts = { expr = true } },
    ["j"] = { "v:count == 0 ? 'gj' : 'j'", "Remap for dealing with visual line wraps", opts = { expr = true } },

    ["YY"] = { "va{Vy", "copy everything between { and } including the brackets", opts },

    ["H"] = { "^", "Move to start of line", opts },
    ["L"] = { "g_", "Move to end of line", opts },

    ["<C-a>"] = { "ggVG", "Select all", opts },

    ["X"] = {
      ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>",
      "Split line with X",
      opts = { silent = true },
    },

    ["<leader>s"] = { ":write!<CR>", "Fast saving file", opts },
    -- ["k"] = { "gk", "Move line on the screen rather than by line in the file", opts },
    -- ["j"] = { "g", "Move line on the screen rather than by line in the file", opts },
  },
  i = {
    -- change to Normal Mode from Insert Mode
    ["jj"] = { "<ESC>", "Switch to Normal from Insert", opts },
    ["jk"] = { "<ESC>", "Switch to Normal from Insert", opts },
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "Move selected line / block of text down in visual mode", opts },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move selected line / block of text up in visual mode", opts },

    ["p"] = { '"_dp', "paste over currently selected text without yanking it", opts },
    ["P"] = { '"_dP', "paste over currently selected text without yanking it", opts },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
  },
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates",
    },
  },
}

return M
