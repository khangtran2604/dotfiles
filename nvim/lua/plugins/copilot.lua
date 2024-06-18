return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      panel = {
        enabled = false,
        auto_refresh = true,
        keymap = {
          jump_next = "<c-j>",
          jump_prev = "<c-k>",
          accept = "<c-l>",
          refresh = "r",
          open = "<M-CR>",
        },
        layout = {
          position = "bottom", -- | top | left | right
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = false,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<c-l>",
          accept_word = false,
          accept_line = false,
          next = "<c-j>",
          prev = "<c-k>",
          dismiss = "<C-h>",
        },
      },
    },
  },
}
