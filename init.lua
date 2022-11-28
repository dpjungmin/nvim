--[[

This is my personal Neovim configuration.

Author: David Jungmin Park
Email: dpjungmin@gmail.com

]]

P = function(x)
  print(vim.inspect(x))
  return x
end

package.path = package.path .. ';' .. os.getenv 'HOME' .. '/nvim-plugins/?.lua'

local fennel = require 'fennel'
local path = vim.fn.stdpath 'config' .. '/fnl'

fennel.path = fennel.path .. ';' .. path .. '/?.fnl'
fennel.path = fennel.path .. ';' .. path .. '/mods/init.fnl'

fennel['macro-path'] = fennel['macro-path'] .. ';' .. path .. '/?.fnl'

fennel.install().dofile(path .. '/main.fnl')
