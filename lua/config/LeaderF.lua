--[[ https://github.com/Yggdroot/LeaderF ]]

vim.g.Lf_WindowPosition = 'bottom' -- 'fullScreen' | 'top' | 'bottom' | 'left' | 'right'
vim.g.Lf_WindowHeight = 0.40
vim.g.Lf_TabpagePosition = 3 -- Make the newly opened tab page the last one
vim.g.Lf_FollowLinks = 1 -- Visit directories pointed to by symlinks when indexing
vim.g.Lf_DisableStl = 0
vim.g.Lf_StlColorscheme = 'gruvbox_material' -- https://github.com/Yggdroot/LeaderF/tree/master/autoload/leaderf/colorscheme
vim.g.Lf_StlSeparator = { left = '', right = '' }
vim.g.Lf_DefaultExternalTool = 'rg'
vim.g.Lf_RememberLastSearch = 0 -- The search string will remain when LeaderF is re-launched
vim.g.Lf_ShowHidden = 0
vim.g.Lf_ShowDevIcons = 1
vim.g.Lf_PreviewCode = 0 -- Whether to show the preview of the code the tag locates in when navigating the tags

vim.g.Lf_Ctags = 'ctags' -- The ctags executable to use
vim.g.Lf_CtagsFuncOpts = { c = '--c-kinds=fp', rust = '--rust-kinds=f' }

vim.g.Lf_Gtags = 'gtags' -- The gtags executable to use
vim.g.Lf_GtagsAutoGenerate = 0

vim.g.Lf_PopupShowStatusline = 0
vim.g.Lf_PopupPreviewPosition = 'top' -- 'top' | 'bottom' | 'left' | 'right' | 'cursor'
vim.g.Lf_PopupColorscheme = 'default' -- https://github.com/Yggdroot/LeaderF/tree/master/autoload/leaderf/colorscheme/popup

local map = require('lib.utils').map

map('n', '<space>.', '<cmd>Leaderf file --bottom<cr>', { desc = 'Search files' })
map('n', '<space>>', '<cmd>Leaderf file --popup<cr>', { desc = 'Show popup to search files' })
map('n', '<space>,', '<cmd>Leaderf buffer --bottom<cr>', { desc = 'Search buffers' })
map('n', '<space><', '<cmd>Leaderf buffer --popup<cr>', { desc = 'Show popup to search buffers' })
map('n', '<space>fr', '<cmd>Leaderf mru --bottom<cr>', { desc = 'Search most recently used files' })
map('n', '<space>fl', '<cmd>Leaderf line --fullScreen<cr>', { desc = 'Search a line in the current buffer' })
map('n', '<space>g', '<cmd>Leaderf rg --fullScreen<cr>', { desc = 'Run ripgrep will full screen' })
map('n', '<space>G', '<cmd>Leaderf rg --popup<cr>', { desc = 'Show a popup to run ripgrep' })

-- Customize highlights (https://github.com/Yggdroot/LeaderF/blob/master/autoload/leaderf/colorscheme/popup/default.vim)
vim.cmd [[
  highlight Lf_hl_cursorline guifg=#00c918 guibg=NONE gui=NONE ctermfg=226 ctermbg=NONE cterm=bold
  highlight Lf_hl_match  guifg=#f4468f guibg=NONE gui=bold ctermfg=85 ctermbg=NONE cterm=bold
]]
