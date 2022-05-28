--[[ https://github.com/tpope/vim-fugitive ]]

local map = require('lib.utils').map

map('n', 'gst', '<cmd>Git<cr>', { desc = 'Show git status' })
