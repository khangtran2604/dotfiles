-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },
    -- Keep cursor centered when scrolling up/down
    ["<C-d>"] = {
      "<C-d>zz",
      desc = "Keep cursor centered when scrolling down",
    },
    ["<C-u>"] = {
      "<C-u>zz",
      desc = "Keep cursor centered when scrolling up",
    },
    -- Hop Motion
    ["<leader>j"] = {
      "<cmd>HopChar2<CR>",
      desc = "Jump to 2 characters",
    },
    -- Harpoon
    ["<leader>ha"] = {
      function() require("harpoon"):list():append() end,
      desc = "Adding file into harpoon",
    },
    ["<leader>hl"] = {
      function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
      desc = "List file into harpoon",
    },
    ["<leader>h1"] = {
      function() require("harpoon"):list():select(1) end,
      desc = "Select Harpoon 1",
    },
    ["<leader>h2"] = {
      function() require("harpoon"):list():select(2) end,
      desc = "Select Harpoon 2",
    },
    ["<leader>h3"] = {
      function() require("harpoon"):list():select(3) end,
      desc = "Select Harpoon 3",
    },
    ["<leader>h4"] = {
      function() require("harpoon"):list():select(4) end,
      desc = "Select Harpoon 4",
    },

    -- Todo List
    ["<leader>lt"] = {
      "<cmd>TodoTelescope<CR>",
      desc = "Show Todo List",
    },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["J"] = {
      ":m '>+1<CR>gv=gv",
      desc = "Move selected down 1 line",
    },
    ["K"] = {
      ":m '<-2<CR>gv=gv",
      desc = "Move selected up 1 line",
    },
    ["p"] = {
      '"_dp',
      desc = "Paste below currently selected text without yanking it",
    },
    ["P"] = {
      '"_dP',
      desc = "Paste above currently selected text without yanking it",
    },
    ["<leader>r"] = {
      '"hy :%s/<C-r>h/',
      desc = "Relace all with selected paragraph",
    },
  },
}
