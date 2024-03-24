require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettierd' },
    typescript = { 'prettierd' },
    javascriptreact = { 'prettierd' },
    typescriptreact = { 'prettierd' },
    json = { 'prettierd' },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 200,
    lsp_fallback = true,
  },
})
