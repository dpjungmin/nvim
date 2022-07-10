vim.cmd [[

" Turn on filetype 'detection', 'plugin', and 'indent' (see `:h filetype-overview`)
filetype plugin indent on

]]

local set = vim.opt

-- For colorscheme
set.syntax = 'enable'
set.background = 'dark'

-- A list of file patterns that should be ignored when expanding wildcards
set.wildignore = { '*.o', '*.obj', '*.dylib', '*.bin', '*.dll', '*.exe' }
set.wildignore:append { '*/.git/*', '*/.svn/*', '*/__pycache__/*', '*/build/**' }
set.wildignore:append { '*.jpg', '*.png', '*.jpef', '*.bmp', '*.gif', '*.tiff', '*.svg', '*.ico' }
set.wildignore:append { '*.pyc', '*.pkl' }
set.wildignore:append { '*.DS_Store' }
set.wildignore:append { '*.aux', '*.bbl', '*.brf', '*.fls', '*.fdb_latexmk', '*.synctex.gz', '*.xdv' }
set.wildignorecase = true

-- Set backup directory
vim.g.backupdir = vim.fn.expand(vim.fn.stdpath('data'), '/backup//')
vim.cmd [[
  let &backupdir=g:backupdir
  let &backupskip=&wildignore
]]
set.backup = true
set.backupcopy = 'yes'

-- General tab settings
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

-- Mouse settings
set.mouse = 'a'
set.mousemodel = 'popup'

-- Popup menu settings
set.pumheight = 10
set.pumblend = 10
set.winblend = 5

-- Specify how keyword completion works
set.complete:append { 'kspell' }
set.complete:remove { 'w', 'b', 'u', 't' }

-- Option settings for diff mode
set.diffopt:append { 'vertical', 'filler', 'closeoff', 'context:3', 'internal' }
set.diffopt:append { 'indent-heuristic', 'algorithm:histogram' }

-- Other settings
set.termguicolors = true
set.guicursor = 'n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20'
set.linebreak = true
set.showbreak = '↪'
set.splitbelow = true
set.splitright = true
set.confirm = true
set.clipboard:append { 'unnamedplus' }
set.matchpairs:append { '<:>', '「:」', '『:』', '【:】', '“:”', '‘:’', '《:》' }
set.list = true
set.listchars = { nbsp = '¬', extends = '»', precedes = '«', trail = '•' }
set.scrolloff = 5
set.number = _G.tovim.line_number
set.relativenumber = _G.tovim.line_number
set.swapfile = false
set.autowrite = true
set.virtualedit = 'block'
set.tildeop = true
set.startofline = false
set.synmaxcol = 200
set.spelllang = { 'en', 'cjk' }
set.undofile = true
set.showmode = false
set.title = true
set.ignorecase = true
set.smartcase = true
set.showcmd = true
set.lazyredraw = true
set.showmatch = true
set.wrap = false
set.autoindent = true
set.smartindent = true
set.foldmethod = 'manual'
set.foldlevel = 0
set.conceallevel = 1
set.foldenable = true
set.signcolumn = 'auto:2'
set.colorcolumn = '80'
set.textwidth = 80
set.shiftround = true
set.hidden = true
