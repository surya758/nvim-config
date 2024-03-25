require('session_manager').setup({})

local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {}) -- A global group for all your config autocommands

vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = 'SessionLoadPost',
  group = config_group,
  callback = function()
    require('nvim-tree.api').tree.toggle(false, true)
  end,
})

-- Auto save session
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  callback = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      -- Don't save while there's any 'nofile' buffer open.
      if
        vim.api.nvim_get_option_value('buftype', { buf = buf }) == 'nofile'
      then
        return
      end
    end
    require('session_manager').save_current_session()
  end,
})
