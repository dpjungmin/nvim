--[[

This is my personal Neovim configuration.

Author: David Jungmin Park
Email: dpjungmin@gmail.com

]]

P = function(x)
  print(vim.inspect(x))
  return x
end

local fennel = require 'fennel'
local path = vim.fn.stdpath 'config' .. '/fnl'

fennel.path = fennel.path .. ';' .. path .. '/?.fnl'
fennel.install().dofile(path .. '/main.fnl')
