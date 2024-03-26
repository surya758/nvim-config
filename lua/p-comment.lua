require('Comment').setup()

require('todo-comments').setup({
  keywords = {
    COMMENT = {
      icon = '',
      color = 'comment',
    },
  },
  colors = {
    comment = { 'Identifier', '#6EAFE8' },
  },
})

-- require('todo-comments').setup()
vim.keymap.set('n', ']t', function()
  require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })

vim.keymap.set('n', '[t', function()
  require('todo-comments').jump_prev()
end, { desc = 'Previous todo comment' })

vim.keymap.set(
  'n',
  '<leader>t',
  '<cmd>TodoTelescope<cr>',
  { desc = 'Telescope Todo Comments' }
)
