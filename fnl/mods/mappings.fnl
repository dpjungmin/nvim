(import-macros {: set! : map!} :macros)

; Leader key
(set vim.g.mapleader "\\")

(map! [n] :<leader>ev "<cmd>tabnew $MYVIMRC<bar>tcd %:h<cr>" {:desc "Edit $MYVIMRC"})
(map! [n] :<leader>sv "<cmd>silent update $MYVIMRC <bar> source $MYVIMRC <bar> call v:lua.vim.notify('Neovim configuration successfully reloaded!', 'info', { 'render': 'default', 'title': 'Neovim' })<cr>"
  {:desc "Update and reload $MYVIMRC"})

(map! [n] "q;" :q: {:desc "Open the command-line window"})
(map! [n] :J "mzJ`z" {:desc "Do not move the cursor when joining lines"})
(map! [n] :<c-a> :gg<s-v>G {:desc "Select all text"})
(map! [n] :<m-h> :^ {:desc "Go to the start of the line"})
(map! [n] :<m-l> :g_ {:desc "Go to the end of the line"})

(map! [n] :<leader>ss (.. ":mks! " vim.g.sessiondir "/") {:desc "Make session" :silent false})
(map! [n] :<leader>so (.. ":so " vim.g.sessiondir "/") {:desc "Open session" :silent false})
(map! [n] :<leader>w :<cmd>update<cr> {:desc "Write only when the buffer has been modified"})
(map! [n] :<leader>q :<cmd>x<cr> {:desc "Write only when changes have been made and quit"})
(map! [n] :<leader>Q :<cmd>xa<cr> {:desc "Write all changed buffers and exit"})
(map! [n] :<leader><leader>q :<cmd>qa!<cr> {:desc "Force close all buffers and exit"})
(map! [n] :<leader>y :<cmd>%y<cr> {:desc "Copy the entire buffer"})
(map! [n] :<leader>cd "<cmd>lcd %:p:h<cr><cmd>pwd<cr>" {:desc "Change current working directory locally and print cwd"})
(map! [n] :<leader><leader>x "<cmd>update<cr><cmd>source %<cr>" {:desc "Source current file"})

(map! [n] :<space>d :<cmd>bd<cr> {:desc "Delete current buffer"})
(map! [n] :<space>D :<cmd>close<cr> {:desc "Close current window"})
(map! [n] :<space>ao (fn [] (string.format "m`%so<esc>``" vim.v.count1)) {:desc "Add a blank line below the current line" :expr true})
(map! [n] :<space>aO (fn [] (string.format "m`%sU<esc>``" vim.v.count1)) {:desc "Add a blank line above the current line" :expr true})
(map! [n] :<space>ov "<cmd>vs %<cr><c-w>h" {:desc "Open current file in a vertical split"})
(map! [n] :<space><space> :a<space><esc>h {:desc "Insert a space after the current character"})
(map! [n] :<space>tc
  (fn []
    (let [o vim.opt]
      (if (next (o.cc:get))
        (set! cc "")
        (set! cc :100))))
  {:desc "Toggle colorcolumn"})

(map! [n] :<space>tC
  (fn []
    (let [o vim.opt]
      (if (o.cursorline:get)
        (set! cursorline false)
        (set! cursorline))))
  {:desc "Toggle cursorline"})
(map! [n] :<space>tn
  (fn []
    (let [o vim.opt]
      (if (o.number:get)
        (do
          (set! number false)
          (set! relativenumber false))
        (do
          (set! number)
          (set! relativenumber)))))
  {:desc "Toggle number"})
(map! [n] :<space>ts
  (fn []
    (let [o vim.opt]
      (if (= 3 (o.laststatus:get))
        (set! laststatus 0)
        (set! laststatus 3))))
  {:desc "Toggle status-line"})

; Better window navigation/resize
(map! [n] :<left> :<c-w>h {:desc "Move left (window)"})
(map! [n] :<down> :<c-w>j {:desc "Move down (window)"})
(map! [n] :<up> :<c-w>k {:desc "Move up (window)"})
(map! [n] :<right> :<c-w>l {:desc "Move right (window)"})

(map! [n] :<c-h> :<c-w>h {:desc "Move left (window)"})
(map! [n] :<c-j> :<c-w>j {:desc "Move down (window)"})
(map! [n] :<c-k> :<c-w>k {:desc "Move up (window)"})
(map! [n] :<c-l> :<c-w>l {:desc "Move right (window)"})

(map! [n] :<s-up> "<cmd>resize +2<cr>" {:desc "Increase window height"})
(map! [n] :<s-down> "<cmd>resize -2<cr>" {:desc "Decrease window height"})
(map! [n] :<s-left> "<cmd>vertical resize +2<cr>" {:desc "Increase window width"})
(map! [n] :<s-right> "<cmd>vertical resize -2<cr>" {:desc "Decrease window width"})

(map! [i] :<c-u> :<esc>viwUea {:desc "Turn the word under the cursor into upper case"})
(each [_ ch (ipairs ["," "." "?" ";" ":" "!"])]
  (map! [i] ch (.. ch "<c-g>u") {:desc (.. "Break " ch " into smaller undo units")}))

; Continuous visual shifting
(map! [vx] :< :<gv {:desc "Shift right"})
(map! [vx] :> :>gv {:desc "Shift left"})
(map! [v] :p "\"_dP") ; hold on to the value that is being pasted

; Move text up/down
(map! [x] :<c-j> ":move '>+1<cr>gv-gv" {:desc "Move text down"})
(map! [x] :<c-k> ":move '<-2<cr>gv-gv" {:desc "Move text up"})

; Plugins

; https://github.com/simrat39/symbols-outline.nvim
(map! [n] :<space>tS "<cmd>SymbolsOutline<cr>" {:desc "Toggle symbols outline"})

; https://github.com/phaazon/hop.nvim
(map! [n] :f (fn s [] ((. (require :hop) :hint_char2))) {:desc "Hop to the occurrence of a bigram"})

; https://github.com/jdhao/whitespace.nvim
(map! [n] :<leader><space> :<cmd>StripTrailingWhitespace<cr> {:desc "Strip trailing whitespace"})

; https://github.com/akinsho/bufferline.nvim
(map! [n] :<space>1 "<cmd>BufferLineGoToBuffer 1<cr>" {:desc "Go to buffer 1"})
(map! [n] :<space>2 "<cmd>BufferLineGoToBuffer 2<cr>" {:desc "Go to buffer 2"})
(map! [n] :<space>3 "<cmd>BufferLineGoToBuffer 3<cr>" {:desc "Go to buffer 3"})
(map! [n] :<space>4 "<cmd>BufferLineGoToBuffer 4<cr>" {:desc "Go to buffer 4"})
(map! [n] :<space>5 "<cmd>BufferLineGoToBuffer 5<cr>" {:desc "Go to buffer 5"})
(map! [n] :<space>6 "<cmd>BufferLineGoToBuffer 6<cr>" {:desc "Go to buffer 6"})
(map! [n] :<space>7 "<cmd>BufferLineGoToBuffer 7<cr>" {:desc "Go to buffer 7"})
(map! [n] :<space>8 "<cmd>BufferLineGoToBuffer 8<cr>" {:desc "Go to buffer 8"})
(map! [n] :<space>9 "<cmd>BufferLineGoToBuffer 9<cr>" {:desc "Go to buffer 9"})
(map! [n] :<space>bp "<cmd>BufferLineTogglePin<cr>" {:desc "Toggle pin for current buffer"})
(map! [n] :<s-l> :<cmd>BufferLineMoveNext<cr> {:desc "Move the current buffer to the next buffer position"})
(map! [n] :<s-h> :<cmd>BufferLineMovePrev<cr> {:desc "Move the current buffer to the previous buffer position"})
; (map! [n] :<tab> "<cmd>BufferLineCycleNext<cr>" {:desc "Go to the next buffer"})
; (map! [n] :<s-tab> "<cmd>BufferLineCyclePrev<cr>" {:desc "Go to the previous buffer"})
(map! [n] :<tab> "<cmd>bn<cr>" {:desc "Go to the next buffer"})
(map! [n] :<s-tab> "<cmd>bp<cr>" {:desc "Go to the previous buffer"})
