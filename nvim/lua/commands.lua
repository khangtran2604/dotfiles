vim.cmd 'set whichwrap+=<,>,[,],h,l'
vim.cmd [[set iskeyword+=-]]

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- In summary, this configuration snippet sets up an autocommand that automatically checks if the current file has been changed by another program every time you switch into a buffer window in Neovim. If there are external changes, it alerts you, ensuring that you're always working with the most up-to-date version of the file
-- vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
--   pattern = { '*' },
--   callback = function()
--     vim.cmd 'checktime'
--   end,
-- })

-- Overall, this autocommand automates interaction with snippets from luasnip based on cursor behavior, contributing to a smoother and more intuitive editing experience in Neovim.
-- vim.api.nvim_create_autocmd({ 'CursorHold' }, {
--   callback = function()
--     local status_ok, luasnip = pcall(require, 'luasnip')
--     if not status_ok then
--       return
--     end
--     if luasnip.expand_or_jumpable() then
--       -- ask maintainer for option to make this silent
--       -- luasnip.unlink_current()
--       vim.cmd [[silent! lua require("luasnip").unlink_current()]]
--     end
--   end,
-- })

-- don't auto comment new line
vim.api.nvim_create_autocmd('BufEnter', { command = [[set formatoptions-=cro]] })

-- go to last loc when opening a buffer
-- this mean that when you open a file, you will be at the last position
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- vim: ts=2 sts=2 sw=2 et
