--[[

This is my personal Neovim configuration.

Author: David Jungmin Park
Email: dpjungmin@gmail.com

]]

local cfg = {
  dependencies = {
    features = { 'nvim-0.7.0', 'python3' },
    executables = { 'git', 'rg', 'fd', 'lazygit' },
  },
  -- Customizable settings
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
  enable_notify = false,
  format_on_save = {
    c = false,
    cpp = false,
    python = false,
    rust = true,
  },
  leader = '\\',
  line_number = false,
  shell = 'bash',
}

local ok, tovim = pcall(require, 'tovim')

if ok then
  cfg = vim.tbl_deep_extend('force', cfg, tovim)
end

require('lib').run(cfg)
