local fixBufferLineSeparator = function()
  vim.api.nvim_set_hl(
    0,
    'BufferLineOffsetSeparator',
    vim.api.nvim_get_hl_by_name('NvimTreeWinSeparator', true)
  )
end

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = fixBufferLineSeparator,
})

fixBufferLineSeparator()
vim.keymap.set('n', '<S-l>', '<CMD>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<S-h>', '<CMD>BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<S-x>', '<CMD>BufferLinePickClose<CR>')

require('bufferline').setup({
  options = {
    indicator = {
      style = 'icon',
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
    },
    buffer_close_icon = '󰅖',
    close_icon = '',
    left_trunc_marker = '<-', --'',
    right_trunc_marker = '->', --'',
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        separator = true,
        text_align = 'left',
      },
    },

    show_buffer_icons = true,
    show_buffer_close_icons = false,

    show_tab_indicators = false,
    persist_buffer_sort = true,
    sort_by = 'id',
    diagnostics = 'nvim_lsp',
    separator_style = { '', '' },
    modified_icon = '●',
    show_close_icon = false,
  },
})
