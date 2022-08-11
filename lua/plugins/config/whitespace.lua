--[[ https://github.com/jdhao/whitespace.nvim ]]

vim.g.trailing_whitespace_exclude_filetypes = { 'git' }

local map = require('lib.utils').map

map(
  'n',
  '<leader><space>',
  '<cmd>StripTrailingWhitespace<cr>',
  { desc = 'Strip trailing whitespace' }
)
