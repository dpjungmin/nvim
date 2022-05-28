local M = {}

M.indent_blankline = {
  toggle = function()
    if _G.tovim.indent_blankline then
      _G.tovim.indent_blankline = false
      vim.notify('indent-blankline OFF', vim.log.levels.ERROR, { timeout = 500 })
    else
      _G.tovim.indent_blankline = true
      vim.notify('indent-blankline ON', vim.log.levels.INFO, { timeout = 500 })
    end

    vim.cmd 'IndentBlanklineToggle'
  end,
  activate = function()
    if not _G.tovim.indent_blankline then
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
    require('telescope.builtin').find_files(
      require('telescope.themes').get_ivy {
        shorten_path = true,
        border = true,
        cwd = '~/.config/nvim',
        prompt = '',
        prompt_prefix = 'Search Neovim config files: ',
        height = 10,
      }
    )
  end,
}

M.autosave = {
  toggle = function()
    if vim.g.autosave_state then
      vim.notify('Auto-save OFF', vim.log.levels.ERROR)
    else
      vim.notify('Auto-save ON', vim.log.levels.INFO)
    end

    vim.cmd('ASToggle')
  end,
}

return M
