local keymap = vim.keymap

keymap.set(
  'n',
  '<leader>ts',
  '<cmd>TSToolsSortImports<cr>',
  { desc = 'Sort Imports' }
)
keymap.set(
  'n',
  '<leader>to',
  '<cmd>TSToolsOrganizeImports<cr>',
  { desc = 'Organise Imports' }
)
keymap.set(
  'n',
  '<leader>ta',
  '<cmd>TSToolsAddMissingImports<cr>',
  { desc = 'Add Missing Imports' }
)

local api = require('typescript-tools.api')
require('typescript-tools').setup({
  handlers = {
    ['textDocument/publishDiagnostics'] = api.filter_diagnostics({ 80006 }),
  },
})
