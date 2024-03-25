local builtin = require('telescope.builtin')
require('telescope').load_extension('harpoon')
local keymap = vim.keymap
keymap.set(
  'n',
  '<leader>f',
  builtin.find_files,
  { desc = 'Telescope Find Files' }
)
keymap.set(
  'n',
  '<leader>g',
  builtin.live_grep,
  { desc = 'Telescope Live Grep' }
)
keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope Buffers' })

local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ['esc'] = actions.close,
      },
    },
    file_ignore_patterns = {
      '.git',
      'lazy-lock.json',
      'node_modules',
      'yarn.lock',
      'package-lock.json',
    },
    dynamic_preview_title = true,
    path_display = { 'smart' },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
  layout_config = {
    horizontal = {
      preview_cutoff = 100,
      preview_width = 0.5,
    },
  },
})
