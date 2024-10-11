return {
  "nvim-telescope/telescope.nvim",
  keys = function()
    local builtin = require("telescope.builtin")
    return {
      { "<leader>,", false },
      { "<leader><space>", "<CMD>Telescope buffers<CR>" },
      { "<leader>fo", builtin.oldfiles },
      -- { "<leader>fo", builtin.find_files },
      {
        "<leader>fg",
        function()
          builtin.git_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
    }
  end,
  opts = function()
    local actions = require("telescope.actions")

    return {
      defaults = {
        -- file_ignore_patterns = { "node_modules", "vendor", "venv", "__pycache__" },
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
            ["<C-p>"] = false,
            ["<C-n>"] = false,
            ["jk"] = { "<esc>", type = "command" },
            ["<C-j>"] = {
              actions.move_selection_next,
              type = "action",
              opts = { nowait = true, silent = true },
            },
            ["<C-k>"] = {
              actions.move_selection_previous,
              type = "action",
              opts = { nowait = true, silent = true },
            },
            ["<C-b>"] = actions.preview_scrolling_up,
            ["<C-f>"] = actions.preview_scrolling_down,
          },
        },
        -- layout_strategy = "horizontal",
        -- layout_config = { prompt_position = "top" },
        -- sorting_strategy = "ascending",
        -- winblend = 0,
      },
    }
  end,
}
