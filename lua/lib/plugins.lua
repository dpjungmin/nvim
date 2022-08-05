-- Functions for plugins

local notify = require('lib.utils').notify
local M = {}

M.indent_blankline = {
  toggle = function()
    if vim.g._indent_blankline then
      vim.g._indent_blankline = false
      notify('Disabled indent-blankline', vim.log.levels.INFO)
    else
      vim.g._indent_blankline = true
      notify('Enabled indent-blankline', vim.log.levels.INFO)
    end

    vim.cmd 'IndentBlanklineToggle'
  end,
  activate = function()
    if not vim.g._indent_blankline then
      return
    end

    for _, ft in ipairs(vim.g.indent_blankline_filetype_exclude) do
      if ft == vim.bo.filetype then
        return
      end
    end

    vim.cmd 'IndentBlanklineEnable'
  end,
}

M.telescope = {
  reloader = function()
    require('telescope.builtin').reloader()
  end,
  find_nvim_configs = function()
    require('telescope.builtin').find_files(require('telescope.themes').get_ivy {
      shorten_path = true,
      border = true,
      cwd = '~/.config/nvim',
      prompt = '',
      prompt_prefix = '[nvim config files]: ',
    })
  end,
}

return M
