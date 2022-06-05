--[[

This is my personal Neovim configuration.

Author: David Jungmin Park
Email: dpjungmin@gmail.com

TODO:
  - Neoformat for Rust (rustfmt) is not working
  - Modify vim-sandwich highlight to #f4468f

]]

require('lib'):init {
  autosave = false,
  buffer_groups = {
    {
      name = 'DOCS',
      keymapping = {
        toggle = '<space>tgdocs',
        close = '<space>cgdocs',
      },
      matcher = function(buf)
        return buf.name:match('%.md') or buf.name:match('%.txt')
      end,
    },
  },
  format_on_save = {
    c = false,
    cpp = false,
    python = true,
    rust = true,
  },
  leader = '\\',
  shell = 'fish',
  theme = 'dark', -- 'dark'
}
