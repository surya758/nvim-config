local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'zbirenbaum/copilot-cmp',
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
  },
  {
    'j-hui/fidget.nvim',
    opts = {},
  },
  {
    'L3MON4D3/LuaSnip',
    build = vim.fn.has('win32') ~= 0 and 'make install_jsregexp' or nil,
    dependencies = {
      'rafamadriz/friendly-snippets',
      'benfowler/telescope-luasnip.nvim',
    },
    config = function(_, opts)
      if opts then
        require('luasnip').config.setup(opts)
      end
      vim.tbl_map(function(type)
        require('luasnip.loaders.from_' .. type).lazy_load()
      end, { 'vscode', 'snipmate', 'lua' })
      -- friendly-snippets - enable standardized comments snippets
      require('luasnip').filetype_extend('typescript', { 'tsdoc' })
      require('luasnip').filetype_extend('javascript', { 'jsdoc' })
      require('luasnip').filetype_extend('lua', { 'luadoc' })
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },
  'fedepujol/move.nvim',
  'nvimdev/lspsaga.nvim',
  'fedepujol/move.nvim',
  { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  { 'echasnovski/mini.nvim', version = '*' },
  'axelvc/template-string.nvim',
  { 'akinsho/toggleterm.nvim', version = '*', config = true },
  'windwp/nvim-ts-autotag',
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',

  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',

  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'WilliamHsieh/catppuccin.nvim',
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  'mfussenegger/nvim-lint',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  {
    'stevearc/conform.nvim',
    opts = {},
  },
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  'mg979/vim-visual-multi',
  'nvim-treesitter/nvim-treesitter',
})

require('base')
require('keymap')
require('p-mason')
require('p-lsp')
require('lsp-lua')
require('p-conform')
require('p-tree')
require('p-telescope')
require('lsp-typescript')
require('p-lint')
require('p-cmp')
require('p-treesitter')
require('p-term')
require('p-indent')
require('p-mini')
require('p-lualine')
require('colors')
require('p-fidget')
require('p-bufferline')
require('p-copilot')
