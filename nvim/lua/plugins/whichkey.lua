return {                -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter',   -- Sets the loading event to 'VimEnter'
  config = function()   -- This is the function that runs, AFTER loading
    require('which-key').setup()

    require('which-key').register {
      -- Rebuild my own definitions
      -- Buffer
      ['<leader>b'] = { name = '[B]uffer', _ = 'which_key_ignore' },
      -- Coding
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>cr'] = { name = 'Rename/Replace', _ = 'which_key_ignore' },
      ['<leader>cg'] = { name = 'Generate', _ = 'which_key_ignore' },
      -- Debugging
      ['<leader>d'] = { name = '[D]ebug', _ = 'which_key_ignore' },
      -- Finding
      ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
      -- Gits
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>gh'] = { name = 'Hunk', _ = 'which_key_ignore' },
      ['<leader>gt'] = { name = 'Toggle', _ = 'which_key_ignore' },
      -- Harpoon
      ['<leader>h'] = { name = '[H]arpoon', _ = 'which_key_ignore' },
      -- Listing
      ['<leader>l'] = { name = '[L]ist', _ = 'which_key_ignore' },
      -- Testing
      ['<leader>t'] = { name = '[T]est', _ = 'which_key_ignore' },
      -- Toggling
      ['<leader>T'] = { name = '[T]oggling', _ = 'which_key_ignore' },
      -- UI
      ['<leader>u'] = { name = '[U]ser Interface', _ = 'which_key_ignore' },
      ['<leader>us'] = { name = 'Splitting', _ = 'which_key_ignore' },
    }
    -- register which-key VISUAL mode
    -- required for visual <leader>hs (hunk stage) to work
    require('which-key').register({
      ['<leader>'] = { name = 'VISUAL <leader>' },

      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>cr'] = { name = 'Rename/Replace', _ = 'which_key_ignore' },

      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>gh'] = { name = 'Hunk', _ = 'which_key_ignore' },
    }, { mode = 'v' })
  end,
}
