return {
  "nvimdev/guard.nvim",
  -- Builtin configuration, optional
  dependencies = {
    "nvimdev/guard-collection",
  },
  config = function()
    local ft = require('guard.filetype')

    -- Format for lua file
    ft('lua'):fmt('lsp')
        :append('stylua')
        :lint('selene')

    -- Format for JS, TS files
    ft('typescript,javascript,typescriptreact'):fmt('prettier')


    -- Format for rust file
    ft('lua'):fmt('lsp')
        :append('rustfmt')

    -- Check code spelling for all file types
    ft('*'):lint('codespell')

    require('guard').setup({
      -- the only options for the setup function
      fmt_on_save = true,
      -- Use lsp if no formatter was defined for this filetype
      lsp_as_default_formatter = false,
    })
  end
}
