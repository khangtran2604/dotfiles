-- references:
-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes
return {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  event = 'VeryLazy',
  keys = {
    { '<leader>e', ':Neotree toggle<CR>', silent = true, desc = 'Toggle Neotree Float' },
    { '<leader>E', ':Neotree toggle left<CR>', silent = true, desc = 'Toggle Neotree Float' },
    { '<leader>o', ':Neotree focus<CR>', silent = true, desc = 'Focus Neotree' },
  },
  config = function()
    require('neo-tree').setup {
      source_selector = {
        winbar = true,
        statusline = false,
      },
      close_if_last_window = true,
      popup_border_style = 'rounded',
      enable_git_status = true,
      enable_modified_markers = true,
      enable_diagnostics = true,
      sort_case_insensitive = true,
      default_component_configs = {
        indent = {
          with_markers = true,
          with_expanders = true,
        },
        modified = {
          symbol = ' ',
          highlight = 'NeoTreeModified',
        },
        icon = {
          folder_closed = '',
          folder_open = '',
          folder_empty = '',
          folder_empty_open = '',
        },
        git_status = {
          symbols = {
            -- Change type
            added = '',
            deleted = '',
            modified = '',
            renamed = '',
            -- Status type
            untracked = '',
            ignored = '',
            unstaged = '',
            staged = '',
            conflict = '',
          },
        },
        -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
        file_size = {
          enabled = true,
          required_width = 64, -- min width of window required to show this column
        },
        type = {
          enabled = true,
          required_width = 122, -- min width of window required to show this column
        },
        -- last_modified = {
        --   enabled = true,
        --   required_width = 88, -- min width of window required to show this column
        -- },
        -- created = {
        --   enabled = true,
        --   required_width = 110, -- min width of window required to show this column
        -- },
        -- symlink_target = {
        --   enabled = false,
        -- },
      },
      buffers = {
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
          --              -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        group_empty_dirs = true, -- when true, empty folders will be grouped together
        show_unloaded = true,
        window = {
          mappings = {
            ['bd'] = 'buffer_delete',
            ['<bs>'] = 'navigate_up',
            ['.'] = 'set_root',
            ['o'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
            ['oc'] = { 'order_by_created', nowait = false },
            ['od'] = { 'order_by_diagnostics', nowait = false },
            ['om'] = { 'order_by_modified', nowait = false },
            ['on'] = { 'order_by_name', nowait = false },
            ['os'] = { 'order_by_size', nowait = false },
            ['ot'] = { 'order_by_type', nowait = false },
          },
        },
      },
      window = {
        position = 'float',
        width = 40,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ['<CR>'] = 'open',
          ['S'] = 'open_split',
          ['s'] = 'open_vsplit',
        },
      },
      filesystem = {
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = false,
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_hidden = true,
          hide_by_name = {
            'node_modules',
          },
          never_show = {
            '.DS_Store',
            'thumbs.db',
          },
        },
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        group_empty_dirs = false,
      },
      event_handlers = {
        {
          event = 'neo_tree_window_after_open',
          handler = function(args)
            if args.position == 'left' or args.position == 'right' then
              vim.cmd 'wincmd ='
            end
          end,
        },
        {
          event = 'neo_tree_window_after_close',
          handler = function(args)
            if args.position == 'left' or args.position == 'right' then
              vim.cmd 'wincmd ='
            end
          end,
        },
      },
    }
  end,
}
