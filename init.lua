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
  buffer_groups = {},
  enable_notify = false,
  format_on_save = {
    c = false,
    cpp = false,
    python = false,
    rust = false,
  },
  leader = '\\',
  shell = 'bash',
}

local ok, custom_cfg = pcall(require, 'tovim-config')

if ok then
  cfg = vim.tbl_extend('force', cfg, custom_cfg)
end

require('lib').run(cfg)
