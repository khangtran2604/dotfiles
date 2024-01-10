local plugins = {
  -- Lazygit
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    keys = {
      {
        "<leader>lg",
        "<cmd> LazyGit <CR>",
        desc = "Open LazyGit",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        -- "vue", "svelte",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "typescript-language-server",
        "rust-analyzer",
      },
    },
  },
  -- Null-ls
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      {
        "<leader>ha",
        function()
          require("harpoon"):list():append()
        end,
        desc = "Add harpoon file",
      },
      {
        "<leader>hl",
        function()
          local harpoon = require "harpoon"
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon quick menu",
      },
      {
        "<leader>h1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "harpoon to file 1",
      },
      {
        "<leader>h2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "harpoon to file 2",
      },
      {
        "<leader>h3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "harpoon to file 3",
      },
      {
        "<leader>h4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "harpoon to file 4",
      },
      {
        "<leader>h5",
        function()
          require("harpoon"):list():select(5)
        end,
        desc = "harpoon to file 5",
      },
      {
        "<leader>hln",
        function()
          require("harpoon"):list():next()
        end,
        desc = "harpoon next file",
      },
      {
        "<leader>hlp",
        function()
          require("harpoon"):list():prev()
        end,
        desc = "harpoon prev file",
      },
    },
  },
  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
    keys = {
      {
        "<leader>j",
        "<cmd>:HopChar2<CR>",
        desc = "Hop find 2 characters",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    keys = {
      {
        "<leader>cc",
        function()
          require("treesitter-context").go_to_context(vim.v.count1)
        end,
        desc = "Treesitter Context jump to current context",
      },
    },
  },
  {
    "simrat39/symbols-outline.nvim",
    lazy = false,
    config = function()
      require "custom.configs.symbols-outline"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end,
    init = function()
      vim.g.dap_virtual_text = true
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  -- Auto generate documents
  {
    "kkoomen/vim-doge",
    lazy = false,
    keys = {
      {
        "<leader>gd",
        "<Plug>(doge-generate)",
        desc = "Auto-generate document",
      },
    },
  },
  -- Rust Plugins
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
      crates.show()
      require("core.utils").load_mappings "crates"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      -- M.completion.completeopt = "menu,menuone,noselect"
      -- M.mapping["<CR>"] = cmp.mapping.confirm {
      --   behavior = cmp.ConfirmBehavior.Insert,
      --   select = false,
      -- }
      table.insert(M.sources, { name = "crates" })
      return M
    end,
  },
  -- End Rust Plugins
}

return plugins
