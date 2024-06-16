return {
  "nvim-telescope/telescope.nvim",
  keys = function()
    local builtin = require("telescope.builtin")

    return {
      {
        "gd",
        builtin.lsp_definitions,
        desc = "Goto definitions",
      },
      {
        "gr",
        builtin.lsp_references,
        desc = "Goto references",
      },
      {
        "gi",
        builtin.lsp_implementations,
        desc = "Goto implementations",
      },
      {
        "<leader>ls",
        builtin.lsp_document_symbols,
        desc = "List document symbols",
      },
      {
        "<leader><space>",
        builtin.buffers,
        desc = "Existing buffers",
      },
      {
        "<leader>fz",
        function()
          builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
            winblend = 0,
            previewer = false,
          }))
        end,
        desc = "Fuzzily find in current buffer",
      },
      {
        "<leader>ff",
        function()
          builtin.find_files({ hidden = false, no_ignore = false })
        end,
        desc = "Find files",
      },
      {
        "<leader>fa",
        function()
          builtin.find_files({ hidden = true, no_ignore = true })
        end,
        desc = "Find all files",
      },
      {
        "<leader>fw",
        builtin.live_grep,
        desc = "Find all files",
      },
      {
        "<leader>fd",
        builtin.diagnostics,
        desc = "Diagnostic list",
      },
      {
        "<leader>;",
        builtin.resume,
        desc = "Telescope resume",
      },
    }
  end,
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      mappings = {
        i = {
          ["<C-u>"] = false,
          ["<C-d>"] = false,
          ["<C-p>"] = false,
          ["<C-n>"] = false,
          ["jk"] = { "<esc>", type = "command" },
          ["<C-j>"] = {
            require("telescope.actions").move_selection_next,
            type = "action",
            opts = { nowait = true, silent = true },
          },
          ["<C-k>"] = {
            require("telescope.actions").move_selection_previous,
            type = "action",
            opts = { nowait = true, silent = true },
          },
          ["<C-b>"] = require("telescope.actions").preview_scrolling_up,
          ["<C-f>"] = require("telescope.actions").preview_scrolling_down,
        },
      },
    },
  },
}
