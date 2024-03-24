local keymap = vim.keymap

keymap.set('n', '<leader>m', '<cmd>TSToolsSortImports<cr>')
keymap.set('n', '<leader>mm', '<cmd>TSToolsOrganizeImports<cr>')
keymap.set('n', '<leader>a', '<cmd>TSToolsAddMissingImports<cr>')

local api = require('typescript-tools.api')
require('typescript-tools').setup({
  handlers = {
    ['textDocument/publishDiagnostics'] = api.filter_diagnostics({ 80006 }),
  },
})
