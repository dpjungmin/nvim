local g = vim.g
local fn = vim.fn

--[[ Global settings ]]
g.vimsyn_embed = 'lP' -- see `:h g:vimsyn_embed`

--[[ Custom globals ]]
g.is_mac = fn.has 'macunix'
g.is_linux = fn.has 'unix' and not fn.has 'macunix'
g.backupdir = fn.expand(fn.stdpath 'data', '/backup//')
g.sessiondir = fn.stdpath 'data' .. '/sessions'
g._indent_blankline = true

os.execute('mkdir -p ' .. g.sessiondir)

--[[ Plugin globals ]]
-- https://github.com/mhinz/vim-startify
g.startify_session_dir = g.sessiondir
vim.cmd [[
  let g:startify_lists = [
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

  let g:startify_bookmarks = [
        \ ]

  let g:startify_commands = [
        \ ]

  let g:ascii = [
        \ '                __',
        \ ' .-----..--.--.|__|.--------.',
        \ ' |     ||  |  ||  ||        |',
        \ ' |__|__| \___/ |__||__|__|__|',
        \ ''
        \]

  let g:startify_custom_header =
        \ 'startify#pad(g:ascii + startify#fortune#boxed())'
]]

-- https://github.com/preservim/vim-markdown
g.vim_markdown_folding_disabled = 1

-- https://github.com/SirVer/ultisnips
g.UltiSnipsSnippetDirectories = { 'UltiSnips', 'snips' }
g.UltiSnipsJumpForwardTrigger = '<c-j>'
g.UltiSnipsJumpBackwardTrigger = '<c-k>'

-- https://github.com/jdhao/better-escape.vim
g.better_escape_shortcut = 'jj'
g.better_escape_interval = 200

-- https://github.com/norcalli/nvim-colorizer.lua requires this to be set
vim.opt.termguicolors = true

-- https://github.com/Olical/conjure/wiki/Quick-start:-Fennel-(Aniseed)
vim.cmd 'let g:conjure#client#fennel#aniseed#aniseed_module_prefix = "aniseed."'

--[[ Global functions ]]
P = function(x)
  print(vim.inspect(x))
  return x
end
