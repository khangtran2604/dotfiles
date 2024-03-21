-- return {
--   'David-Kunz/gen.nvim',
--   opts = {
--     model = 'llama2',
--     display_mode = 'split',
--     no_auto_close = true,
--   },
--   config = function()
--     require('gen').prompts['Coding'] = {
--       prompt = 'You are a senior devops engineer, acting as an assistant. You offer help with cloud technologies like: Terraform, AWS, kubernetes, typescript, ReactJS. You answer with code examples when possible. $input:\n$text',
--       -- replace = false,
--     }
--
--     vim.keymap.set({ 'n', 'v' }, '<leader>]', ':Gen<CR>')
--
--     require('gen').setup {}
--   end,
-- }
--
return {
  'David-Kunz/gen.nvim',
  opts = {
    -- model = 'llama2', -- The default model to use.
    display_mode = 'split', -- The display mode. Can be "float" or "split".
    show_prompt = false, -- Shows the Prompt submitted to Ollama.
    show_model = false, -- Displays which model you are using at the beginning of your chat session.
    quit_map = 'q', -- set keymap for quit
    no_auto_close = false, -- Never closes the window automatically.
    debug = false, -- Prints errors and the command which is run.
  },
  event = 'VeryLazy',
  config = function(_, opts)
    local gen = require 'gen'

    vim.keymap.set({ 'n', 'v' }, '<leader>mm', ':Gen<CR>')

    gen.prompts['Typescript Coding'] = {
      prompt = 'You are a senior software engineer, acting as an assistant. You offer help with  technologies like:  AWS, Javascript, Typescript, NodeJS, ReactJS. You answer with code examples when possible. $input:\n$text',
    }

    gen.setup(opts)
  end,
}
