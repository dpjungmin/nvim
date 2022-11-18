-- Turn on filetype 'detection', 'plugin', and 'indent' (see `:h filetype-overview`)
vim.cmd 'filetype plugin indent on'

local o = vim.opt

-- A list of file patterns that should be ignored when expanding wildcards
o.wildignore = { '*.o', '*.obj', '*.dylib', '*.bin', '*.dll', '*.exe' }
o.wildignore:append { '*/.git/*', '*/.svn/*', '*/__pycache__/*', '*/build/**' }
o.wildignore:append { '*.jpg', '*.png', '*.jpef', '*.bmp', '*.gif', '*.tiff', '*.svg', '*.ico' }
o.wildignore:append { '*.pyc', '*.pkl' }
o.wildignore:append { '*.DS_Store' }
o.wildignore:append {
  '*.aux',
  '*.bbl',
  '*.brf',
  '*.fls',
  '*.fdb_latexmk',
  '*.synctex.gz',
  '*.xdv',
}
o.wildignorecase = true

-- Set backup directory
vim.cmd [[
  let &backupdir=g:backupdir
  let &backupskip=&wildignore
]]
o.backup = true
o.backupcopy = 'yes'

-- General tab settings
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

-- Mouse settings
o.mouse = 'a'
o.mousemodel = 'popup'

-- Popup menu settings
o.pumheight = 10
o.pumblend = 10
o.winblend = 0

-- Specify how keyword completion works
o.complete:append { 'kspell' }
o.complete:remove { 'w', 'b', 'u', 't' }

-- Option settings for diff mode
o.diffopt:append { 'vertical', 'filler', 'closeoff', 'context:3', 'internal' }
o.diffopt:append { 'indent-heuristic', 'algorithm:histogram' }

-- Other settings
o.number = false
o.relativenumber = false
o.guicursor = 'n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20'
o.linebreak = true
o.showbreak = '↪'
o.splitbelow = true
o.splitright = true
o.confirm = true
o.clipboard:append { 'unnamedplus' }
o.matchpairs:append { '<:>', '「:」', '『:』', '【:】', '“:”', '‘:’', '《:》' }
o.list = true
o.listchars = { nbsp = '¬', extends = '»', precedes = '«', trail = '•' }
o.scrolloff = 5
o.swapfile = false
o.autowrite = true
o.virtualedit = 'block'
o.tildeop = true
o.startofline = false
o.synmaxcol = 200
o.spelllang = { 'en', 'cjk' }
o.undofile = true
o.showmode = false
o.title = true
o.ignorecase = true
o.smartcase = true
o.showcmd = true
o.lazyredraw = true
o.showmatch = true
o.wrap = false
o.autoindent = true
o.smartindent = true
o.foldmethod = 'manual'
o.foldlevel = 0
o.conceallevel = 1
o.foldenable = true
o.signcolumn = 'auto:2'
o.colorcolumn = '80'
o.textwidth = 80
o.shiftround = true
o.hidden = true
o.signcolumn = 'yes'
o.cursorline = true
-- o.laststatus = 0
-- o.cmdheight = 0
