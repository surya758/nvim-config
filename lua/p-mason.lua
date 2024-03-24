require('mason').setup({
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
})

require('mason-lspconfig').setup()

require('mason-tool-installer').setup({
  ensure_installed = {
    'lua-language-server',
    'stylua',
    'biome',
    'eslint_d',
    'prettierd',
    'tsserver',
  },
})
