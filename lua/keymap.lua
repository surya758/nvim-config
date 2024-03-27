vim.g.mapleader = ' '
local keymap = vim.keymap

keymap.set('n', '<C-a>', 'ggVG', { desc = 'Select Whole File Content' })

keymap.set({ 'n', 'x' }, '<leader>p', '"0p', { desc = 'Absolute Copy' })
keymap.set(
  'n',
  '<leader>qqq',
  '<cmd>qa!<cr>',
  { desc = 'Quit All Mercilessly!' }
)
-- Move the current visual selection up
keymap.set(
  'v',
  'K',
  ":m '<-2<CR>gv=gv",
  { noremap = true, desc = 'Move Line/Block Up' }
)

-- Move the current visual selection down
keymap.set(
  'v',
  'J',
  ":m '>+1<CR>gv=gv",
  { noremap = true, desc = 'Move Line/Block Down' }
)

-- Trouble keymaps
vim.keymap.set('n', '<leader>xx', function()
  require('trouble').toggle()
end, { desc = 'Trouble Toggle' })
vim.keymap.set('n', '<leader>xw', function()
  require('trouble').toggle('workspace_diagnostics')
end, { desc = 'Trouble Workspace Diagnostics' })
vim.keymap.set('n', '<leader>xd', function()
  require('trouble').toggle('document_diagnostics')
end, { desc = 'Trouble Document Diagnostics' })
vim.keymap.set('n', '<leader>xq', function()
  require('trouble').toggle('quickfix')
end, { desc = 'Trouble Quickfix' })
vim.keymap.set('n', '<leader>xl', function()
  require('trouble').toggle('loclist')
end, { desc = 'Trouble Loclist' })

keymap.set('n', '<c-h>', function()
  vim.o.hlsearch = not vim.o.hlsearch
end, { desc = 'Toggle Search Highlighting' })

keymap.set('n', '<leader>rl', function()
  vim.o.relativenumber = not vim.o.relativenumber
end, { desc = 'Toggle Relative Number' })

-- keymap.set('n', '<leader>q', '<cmd>q<cr>', { desc = 'Quit' })
keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Write' })
-- keymap.set('n', '<leader>x', '<cmd>x<cr>', { desc = 'Write And Quit' })

keymap.set('n', 'j', [[v:count?'j':'gj']], { noremap = true, expr = true })
keymap.set('n', 'k', [[v:count?'k':'gk']], { noremap = true, expr = true })

-- harpoon
vim.keymap.set(
  'n',
  '<leader>ha',
  ":lua require('harpoon.mark').add_file()<CR>",
  { desc = 'Harpoon Add File' }
)
vim.keymap.set(
  'n',
  '<leader>th',
  ':Telescope harpoon marks<CR>',
  { desc = 'Telescope Harpoon' }
)
vim.keymap.set(
  'n',
  '<leader>hh',
  ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
  { desc = 'Harpoon Toggle Quick Menu' }
)
