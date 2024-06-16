return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "rust",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["a="] = "@assignment.outer", -- Select outer part of an assignment
            ["i="] = "@assignment.inner", -- Select inner part of an assignment
            ["l="] = "@assignment.lhs", -- Select left hand side of an assignment
            ["r="] = "@assignment.rhs", -- Select right hand side of an assignment

            ["aa"] = "@parameter.outer", -- Select outer part of a parameter/argument
            ["ia"] = "@parameter.inner", -- Select inner part of a parameter/argument

            ["af"] = "@call.outer", -- Select outer part of a function call
            ["if"] = "@call.inner", -- Select inner part of a function call

            ["ai"] = "@conditional.outer", -- Select outer part of a conditional
            ["ii"] = "@conditional.inner", -- Select inner part of a conditional

            ["al"] = "@loop.outer", -- Select outer part of a loop
            ["il"] = "@loop.inner", -- Select inner part of a loop

            ["am"] = "@function.outer", -- Select outer part of a method/function definition
            ["im"] = "@function.inner", -- Select inner part of a method/function definition

            ["ac"] = "@class.outer", -- Select outer part of a class
            ["ic"] = "@class.inner", -- Select inner part of a class
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]f"] = "@call.outer", -- Next function call start
            ["]a"] = "@function.outer", -- Next method/function definition start
            ["]c"] = "@class.outer", -- Next class start
            ["]i"] = "@conditional.outer", -- Next conditional start
            ["]l"] = "@loop.outer", -- Next loop start
          },
          goto_next_end = {
            ["]F"] = "@call.outer", -- Next function call end
            ["]A"] = "@function.outer", -- Next method/function definition end
            ["]C"] = "@class.outer", -- Next class end
            ["]I"] = "@conditional.outer", -- Next conditional end
            ["]L"] = "@loop.outer", -- Next loop end
          },
          goto_previous_start = {
            ["[f"] = "@call.outer", -- Previous function call start
            ["[a"] = "@function.outer", -- Previous method/function definition start
            ["[c"] = "@class.outer", -- Previous class start
            ["[i"] = "@conditional.outer", -- Previous conditional start
            ["[l"] = "@loop.outer", -- Previous loop start
          },
          goto_previous_end = {
            ["[F"] = "@call.outer", -- Previous function call end
            ["[A"] = "@function.outer", -- Previous method/function definition end
            ["[C"] = "@class.outer", -- Previous class end
            ["[I"] = "@conditional.outer", -- Previous conditional end
            ["[L"] = "@loop.outer", -- Previous loop end
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {

        "tsx",
        "typescript",
      })
    end,
  },
}
