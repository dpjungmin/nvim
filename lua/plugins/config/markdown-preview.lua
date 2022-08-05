--[[ https://github.com/iamcco/markdown-preview.nvim ]]

vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_refresh_slow = 0
vim.g.mkdp_command_for_global = 0
vim.g.mkdp_open_to_the_world = 1
vim.g.mkdp_open_ip = '' -- See: https://github.com/iamcco/markdown-preview.nvim/pull/9
vim.g.mkdp_browser = ''
vim.g.mkdp_echo_preview_url = 0
vim.g.mkdp_browserfunc = ''
vim.g.mkdp_theme = 'light' -- 'dark' | 'light' | '' (Defined based on system preference)

local map = require('lib.utils').map

map('n', '<space>tm', '<cmd>MarkdownPreviewToggle<cr>', { desc = 'Toggle markdown preview' })
