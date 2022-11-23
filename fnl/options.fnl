(var o vim.opt)

; Turn on filetype 'detection', 'plugin', and 'indent' (see `:h filetype-overview`)
(vim.cmd "filetype plugin indent on")

; A list of file patterns that should be ignored when expanding wildcards
(set o.wildignorecase true)
(set o.wildignore ["*.o" "*.obj" "*.dylib" "*.bin" "*.dll" "*.exe"])
(o.wildignore:append ["*/.git/*"
                      "*/.svn/*"
                      "*/__pycache__/*"
                      "*/build/**"
                      "*.jpg"
                      "*.png"
                      "*.jpef"
                      "*.bmp"
                      "*.gif"
                      "*.tiff"
                      "*.svg"
                      "*.ico"
                      "*.pyc"
                      "*.pkl"
                      "*.DS_Store"
                      "*.aux"
                      "*.bbl"
                      "*.brf"
                      "*.fls"
                      "*.fdb_latexmk"
                      "*.synctex.gz"
                      "*.xdv"])

; Set backup directory
(vim.cmd "
         let &backupdir=g:backupdir
         let &backupskip=&wildignore")
(set o.backup true)
(set o.backupcopy "yes")

; General tab settings
(set o.tabstop 4)
(set o.softtabstop 4)
(set o.shiftwidth 4)
(set o.expandtab true)

; Mouse settings
(set o.mouse "a")
(set o.mousemodel "popup")

; Popup menu settings
(set o.pumheight 10)
(set o.pumblend 10)
(set o.winblend 0)

; Specify how keyword completion works
(o.complete:append ["kspell"])
(o.complete:remove ["w" "b" "u" "t"])

; Option settings for diff mode
(o.diffopt:append ["vertical" "filler" "closeoff" "context:3" "internal"])
(o.diffopt:append ["indent-heuristic" "algorithm:histogram"])

; Other settings
(set o.number false)
(set o.relativenumber false)
(set o.guicursor "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20")
(set o.linebreak true)
(set o.showbreak "↪")
(set o.splitbelow true)
(set o.splitright true)
(set o.confirm true)
(o.clipboard:append ["unnamedplus"])
(o.matchpairs:append ["<:>" "「:」" "『:』" "【:】" "“:”" "‘:’" "《:》"])
(set o.list true)
(set o.listchars {"nbsp" "¬" "extends" "»" "precedes" "«" "trail" "•"})
(set o.scrolloff 5)
(set o.swapfile false)
(set o.autowrite true)
(set o.virtualedit "block")
(set o.tildeop true)
(set o.startofline false)
(set o.synmaxcol 200)
(set o.spelllang ["en" "cjk"])
(set o.undofile true)
(set o.showmode false)
(set o.title true)
(set o.ignorecase true)
(set o.smartcase true)
(set o.showcmd true)
(set o.lazyredraw true)
(set o.showmatch true)
(set o.wrap false)
(set o.autoindent true)
(set o.smartindent true)
(set o.foldmethod "manual")
(set o.foldlevel 0)
(set o.conceallevel 1)
(set o.foldenable true)
(set o.signcolumn "auto:2")
(set o.colorcolumn "")
(set o.textwidth 100)
(set o.shiftround true)
(set o.hidden true)
(set o.signcolumn "yes")
(set o.cursorline false)
(set o.laststatus 0)
(set o.cmdheight 0)
