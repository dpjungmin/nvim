(local auto-cmds {
  :hl-yank [["TextYankPost"
  "*"
  "silent!"
  "lua vim.highlight.on_yank { higroup = 'YankColor', timeout = 300, on_visual = true }"]]
  :open-terminal [["TermOpen" "*" "setlocal norelativenumber nonumber"]
                  ["TermOpen" "*" "startinsert"]]
  :dyn-smartcase [["CmdLineEnter" ":" "set nosmartcase"]
                  ["CmdLineLeave" ":" "set smartcase"]]
  :accurate-syn-hl [["BufEnter" "*" ":syntax sync fromstart"]]
  :au-reload [["FileChangedShellPost"
               "*"
               "vim.notify('File changed on disk. Buffer reloaded!', vim.log.levels.WARN)"]
              ["FocusGained,CursorHold" "*" "if getcmdwintype() == '' | checktime | endif"]]
  :toggle-nu-on-imode [["BufEnter,FocusGained,InsertLeave,WinEnter" "*" "if &nu | set rnu | endif"]
                       ["BufLeave,FocusLost,InsertEnter,WinLeave" "*" "if &nu | set nornu | endif"]]
  :resume-cursor-position [["BufReadPost" "*" "lua require('lib')['resume-last-cursor-pos']()"]]
  :toggle-indent-blankline [["InsertEnter" "*" "IndentBlanklineDisable"]
                            ["InsertLeave" "*" "lua require('lib')['indent-blankline-activate']()"]]
  :format-on-save [["BufWritePre"
                    "*"
                    "try | undojoin | Neoformat | catch /^Vim\\%((\\a\\+)\\)\\=:E790/ | finally | silent Neoformat | endtry"]]
  :au-compile-packer [["BufWritePre" "*/nvim/lua/plugins.lua" "source <afile> | PackerCompile"]]
  :puppet [["BufNewFile,BufRead" "*.pp" "setfiletype puppet"]
           ["BufNewFile,BufRead" "*.pp" "set shiftwidth=2 softtabstop=2 filetype=puppet"]]
  :justfile [["BufNewFile,BufRead" "justfile" "setf make"]]})

(each [g cmds (pairs auto-cmds)]
  (do
    (vim.cmd (.. "augroup " g))
    (vim.cmd "autocmd!")
    (each [_ cmd (ipairs cmds)]
      (vim.cmd (table.concat (vim.tbl_flatten ["autocmd" cmd]) " ")))
    (vim.cmd "augroup END")))