--[[

This is my personal Neovim configuration.

Author: David Jungmin Park
Email: dpjungmin@gmail.com

TODO:
  - customize highlight for lightline
  - customize highlight for treesitter
  - create light theme

--]]

_G.config = {
  line_number = false,
  shell = 'fish',
}

local theme = os.getenv 'THEME' or 'dark'
assert(theme == 'light' or theme == 'dark', 'Invalid THEME')
vim.opt.background = theme

require('lib').run()
