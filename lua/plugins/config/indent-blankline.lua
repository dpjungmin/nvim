--[[ https://github.com/lukas-reineke/indent-blankline.nvim ]]

require('indent_blankline').setup {
  char = '▏',
  show_end_of_line = false,
  disable_with_nolist = true,
  buftype_exclude = { 'terminal' },
  filetype_exclude = { 'help', 'git', 'markdown', 'snippets', 'text', 'gitconfig', 'alpha' },
}

local map = require('lib.utils').map

map('n', '<space>ti', require('lib.plugins').indent_blankline.toggle, { desc = 'Toggle indent blankline' })
