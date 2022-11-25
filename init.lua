--[[

This is my personal Neovim configuration.

Author: David Jungmin Park
Email: dpjungmin@gmail.com

]]

P = function(x)
  print(vim.inspect(x))
  return x
end

MAP = function(modes, lhs, rhs, opts)
  local o = { noremap = true, silent = true }
  if opts then
    o = vim.tbl_extend('force', o, opts)
  end
  vim.keymap.set(modes, lhs, rhs, o)
end

local fennel = require 'fennel'
local path = vim.fn.stdpath 'config' .. '/fnl'

fennel.path = fennel.path .. ';' .. path .. '/?.fnl;' .. path .. '/mods/init.fnl'
fennel['macro-path'] = fennel['macro-path'] .. ';' .. path .. '/?.fnl'

fennel.install().dofile(path .. '/main.fnl')
