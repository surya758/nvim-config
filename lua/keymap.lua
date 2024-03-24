vim.g.mapleader = ' '
local keymap = vim.keymap

keymap.set('n', '<C-a>', 'ggVG')

keymap.set({ 'n', 'x' }, '<leader>p', '"0p')

keymap.set('n', '<c-h>', function()
  vim.o.hlsearch = not vim.o.hlsearch
end, { desc = 'toggle search highlighting' })

keymap.set('n', '<C-n>', function()
  vim.o.relativenumber = not vim.o.relativenumber
end, { desc = 'toggle relative number' })

keymap.set('n', '<leader>q', '<cmd>q<cr>')
keymap.set('n', '<leader>w', '<cmd>w<cr>')
keymap.set('n', '<leader>x', '<cmd>x<cr>')

keymap.set('n', 'j', [[v:count?'j':'gj']], { noremap = true, expr = true })
keymap.set('n', 'k', [[v:count?'k':'gk']], { noremap = true, expr = true })