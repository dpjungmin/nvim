--[[ https://github.com/andymass/vim-matchup ]]

local map = require('lib.utils').map

map('n', '<space>?', '<cmd>MatchupWhereAmI?<cr>', { desc = 'Echos your position in the code in a breadcrumb-style' })
