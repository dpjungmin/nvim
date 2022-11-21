--[[

This is my personal Neovim configuration.

Author: David Jungmin Park
Email: dpjungmin@gmail.com

]]

require('lib').run {
  features = { 'nvim-0.7.0', 'python3' },
  executables = { 'git', 'rg', 'fd', 'lazygit' },
  modules = { 'globals', 'mappings', 'options', 'plugins' },
}
