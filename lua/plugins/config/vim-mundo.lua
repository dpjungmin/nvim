--[[ https://github.com/simnalamburt/vim-mundo ]]

vim.g.mundo_width = 50
vim.g.mundo_preview_height = 15
vim.g.mundo_preview_bottom = 1
vim.g.mundo_right = 1
vim.g.mundo_playback_delay = 60

local map = require('lib.utils').map

map('n', '<space>tu', '<cmd>MundoToggle<cr>', { desc = 'Toggle undo tree' })
