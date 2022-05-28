--[[ https://github.com/rbong/vim-flog ]]

local map = require('lib.utils').map

map('n', 'gl', '<cmd>Flog<cr>', { desc = 'Open git commit graph' })
