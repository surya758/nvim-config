require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'tsx',
    'lua',
    'javascript',
    'typescript',
    'regex',
    'json',
    'html',
    'css',
    'markdown',
    'markdown_inline',
  },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  },
})

require('template-string').setup()

-- folding setting
local opt = vim.opt
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldenable = false
