--[[ https://github.com/phaazon/hop.nvim ]]

require('hop').setup {
  quit_key = '<esc>',
  case_insensitive = true,
  char2_fallback_key = '<cr>',
}

local map = require('lib.utils').map

map('n', 'f', function() return require('hop').hint_char2() end, { desc = 'Hop to the occurrence of a bigram' })
