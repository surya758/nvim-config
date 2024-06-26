local keymap = vim.keymap
require('lspsaga').setup({
  ui = {
    border = 'rounded',
  },
  lightbulb = {
    enable = false,
  },
})

keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>')
keymap.set(
  'n',
  '<leader>lo',
  '<cmd>Lspsaga outline<cr>',
  { desc = 'Lspsaga Outline' }
)

local builtin = require('telescope.builtin')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    vim.keymap.set(
      'n',
      '<leader>lgd',
      '<cmd>Lspsaga goto_definition<cr>',
      { desc = 'Goto Definition', buffer = ev.buf }
    )
    vim.keymap.set(
      'n',
      '<leader>l',
      '<cmd>Lspsaga hover_doc<cr>',
      { desc = 'Hover Doc', buffer = ev.buf }
    )
    vim.keymap.set(
      'n',
      '<leader>rn',
      '<cmd>Lspsaga rename<cr>',

      { desc = 'Rename', buffer = ev.buf }
    )
    vim.keymap.set(
      { 'n', 'v' },
      '<space>ca',
      '<cmd>Lspsaga code_action<cr>',

      { desc = 'Code Action', buffer = ev.buf }
    )
    vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
  end,
})
