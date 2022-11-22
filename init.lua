--[[

This is my personal Neovim configuration.

Author: David Jungmin Park
Email: dpjungmin@gmail.com

]]

local fennel = require 'fennel'
local path = vim.fn.stdpath 'config' .. '/fnl'

fennel.path = fennel.path .. ';' .. path .. '/?.fnl'
fennel.install().dofile(path .. '/main.fnl')
