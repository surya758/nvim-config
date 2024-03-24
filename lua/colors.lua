vim.g.catppuccin_diagnostic_line_highlight = 1
vim.cmd('colorscheme catppuccin')

vim.fn.sign_define({
  {
    name = 'DiagnosticSignError',
    text = '󰯆',
    texthl = 'DiagnosticSignError',
    linehl = 'ErrorLine',
  },
  {
    name = 'DiagnosticSignWarn',
    text = '',
    texthl = 'DiagnosticSignWarn',
    linehl = 'WarnLine',
  },
  {
    name = 'DiagnosticSignHint',
    text = '󰝄',
    texthl = 'DiagnosticSignHint',
    linehl = 'HintLine',
  },
})
