--[[ https://github.com/lukas-reineke/indent-blankline.nvim ]]

require('indent_blankline').setup {
  char = '▏',
  show_end_of_line = false,
  disable_with_nolist = true,
  buftype_exclude = { 'terminal' },
  filetype_exclude = { 'help', 'git', 'markdown', 'snippets', 'text', 'gitconfig', 'alpha' },

  space_char_blankline = ' ',
  show_current_context = true,
  show_current_context_start = false,
  context_char_list = { '▏' },
}

local map = require('lib.utils').map

map('n', '<space>ti', function()
  if vim.g._indent_blankline then
    vim.g._indent_blankline = false
    vim.notify('Disabled indent-blankline', vim.log.levels.INFO)
  else
    vim.g._indent_blankline = true
    vim.notify('Enabled indent-blankline', vim.log.levels.INFO)
  end

  vim.cmd 'IndentBlanklineToggle'
end, { desc = 'Toggle indent blankline' })
