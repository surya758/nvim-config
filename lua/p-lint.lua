local lint = require('lint')

local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

lint.linters_by_ft = {
  typescript = { 'biomejs', 'eslint_d' },
  javascript = { 'biomejs', 'eslint_d' },
  typescriptreact = { 'biomejs', 'eslint_d' },
  javascriptreact = { 'biomejs', 'eslint_d' },
}

local eslint = lint.linters.eslint_d

eslint.args = {
  '--no-warn-ignored', -- <-- this is the key argument
  '--format',
  'json',
  '--stdin',
  '--stdin-filename',
  function()
    return vim.api.nvim_buf_get_name(0)
  end,
}

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})
