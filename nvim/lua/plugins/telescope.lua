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
  opts = function(_, opts)
    -- Flash with Telescope
    if not LazyVim.has("flash.nvim") then
      return
    end

    local function flash(prompt_bufnr)
      require("flash").jump({
        pattern = "^",
        label = { after = { 0, 0 } },
        search = {
          mode = "search",
          exclude = {
            function(win)
              return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
            end,
          },
        },
        action = function(match)
          local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
          picker:set_selection(match.pos[1] - 1)
        end,
      })
    end

    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      mappings = { n = { s = flash }, i = { ["<c-s>"] = flash } },
    })

    local actions = require("telescope.actions")

    local open_with_trouble = function(...)
      return require("trouble.sources.telescope").open(...)
    end
    local find_files_no_ignore = function()
      local action_state = require("telescope.actions.state")
      local line = action_state.get_current_line()
      LazyVim.pick("find_files", { no_ignore = true, default_text = line })()
    end
    local find_files_with_hidden = function()
      local action_state = require("telescope.actions.state")
      local line = action_state.get_current_line()
      LazyVim.pick("find_files", { hidden = true, default_text = line })()
    end

    opts.defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      winblend = 0,
      -- open files in the first window that is an actual file.
      -- use the current window if no other window is available.
      get_selection_window = function()
        local wins = vim.api.nvim_list_wins()
        table.insert(wins, 1, vim.api.nvim_get_current_win())
        for _, win in ipairs(wins) do
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.bo[buf].buftype == "" then
            return win
          end
        end
        return 0
      end,
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
          ["<C-t>"] = open_with_trouble,
          ["<A-t>"] = open_with_trouble,
          ["<A-i>"] = find_files_no_ignore,
          ["<A-h>"] = find_files_with_hidden,
          ["<C-Down>"] = actions.cycle_history_next,
          ["<C-Up>"] = actions.cycle_history_prev,
        },
        n = {
          ["q"] = actions.close,
        },
      },
    }
  end,
  -- opts = {
  --   defaults = {
  --     layout_strategy = "horizontal",
  --     layout_config = { prompt_position = "top" },
  --     sorting_strategy = "ascending",
  --     winblend = 0,
  --   },
  -- },
}
