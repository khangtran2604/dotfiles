return {
  "zbirenbaum/copilot.lua",
  opts = function(_, opts)
    opts.suggestion = vim.tbl_extend("force", opts.suggestion, {
      keymap = {
        accept = "<c-l>",
        accept_word = false,
        accept_line = false,
        next = "<c-j>",
        prev = "<c-k>",
        dismiss = "<C-h>",
      },
    })

    opts.panel = {
      enabled = false,
    }

    return opts
  end,
}
