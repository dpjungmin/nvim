-- https://github.com/lukas-reineke/indent-blankline.nvim

(require 'indent_blankline').setup {
  char = '│', -- '▏'
  disable_with_nolist = true,
  buftype_exclude = {
    'terminal',
  },
  filetype_exclude = {
    'help',
    'git',
    'markdown',
    'snippets',
    'text',
    'gitconfig',
    'alpha',
  },
  space_char_blankline = ' ',
  show_current_context = true,
  show_end_of_line = false,
  show_current_context_start = false,
}
