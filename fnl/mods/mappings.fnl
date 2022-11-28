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
(map! [n] :<space>aO (fn [] (string.format "m`%sO<esc>``" vim.v.count1)) {:desc "Add a blank line above the current line" :expr true})
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

; https://github.com/lukas-reineke/indent-blankline.nvim

(map! [n] :<space>ti
  (fn indent-blankline-toggle []
    (if vim.g._indent_blankline
      (set vim.g._indent_blankline false)
      (set vim.g._indent_blankline true))
    (vim.cmd :IndentBlanklineToggle))
  {:desc "Toggle indent blankline"})

; https://github.com/simrat39/symbols-outline.nvim
(map! [n] :<space>tS "<cmd>SymbolsOutline<cr>" {:desc "Toggle symbols outline"})

; https://github.com/phaazon/hop.nvim
(map! [n] :f (fn s [] ((. (require :hop) :hint_char2))) {:desc "Hop to the occurrence of a bigram"})

; https://github.com/jdhao/whitespace.nvim
(map! [n] :<leader><space> :<cmd>StripTrailingWhitespace<cr> {:desc "Strip trailing whitespace"})

; https://github.com/iamcco/markdown-preview.nvim
(map! [n] :<space>tm :<cmd>MarkdownPreviewToggle<cr> {:desc "Toggle markdown preview"})

; https://github.com/simnalamburt/vim-mundo
(map! [n] :<space>tu :<cmd>MundoToggle<cr> {:desc "Toggle undo tree"})

; https://github.com/andymass/vim-matchup
(map! [n] :<space>? :<cmd>MatchupWhereAmI?<cr> {:desc "Echos your position in the code in a breadcrumb-style"})

; https://github.com/tpope/vim-fugitive
(map! [n] :gst :<cmd>Git<cr> {:desc "Show git status"})

; https://github.com/rbong/vim-flog
(map! [n] :gl :<cmd>Flog<cr> {:desc "Open git commit graph"})

; https://github.com/kyazdani42/nvim-tree.lua
(map! [n] :<space>s :<cmd>NvimTreeToggle<cr> {:desc "Toggle nvim-tree"})
(map! [n] :<leader>r :<cmd>NvimTreeCollapse<cr> {:desc "Collapse nvim-tree"})

; https://github.com/neovim/nvim-lspconfig
(map! [n] :<leader>l :<cmd>LspStart<cr> {:desc "Start LSP client"})
(map! [n] :<leader><leader>l :<cmd>LspStop<cr> {:desc "Stop LSP client"})
(map! [n] :<space>q (fn [] (vim.diagnostic.setqflist {:open true})) {:desc "Add all diagnostics to the quickfix list"})
(map! [n] :<space>e vim.diagnostic.open_float {:desc "Show diagnostics in a floating window"})
(map! [n] "[d" vim.diagnostic.goto_prev {:desc "Move to the previous diagnostic in the current buffer"})
(map! [n] "]d" vim.diagnostic.goto_next {:desc "Move to the next diagnostic in the current buffer"})

; https://github.com/akinsho/toggleterm.nvim
(map! [t] :<esc> :<c-\\><c-n> {:desc "Go from Insert mode to Normal mode"})
(map! [t] :<c-h> :<c-\\><c-n><c-w>h {:desc "Move left (window)"})
(map! [t] :<c-j> :<c-\\><c-n><c-w>j {:desc "Move down (window)"})
(map! [t] :<c-k> :<c-\\><c-n><c-w>k {:desc "Move up (window)"})
(map! [t] :<c-l> :<c-\\><c-n><c-w>l {:desc "Move right (window)"})
(map! [v] :<leader>s :<cmd>ToggleTermSendVisualSelection<cr> {:desc "Send the visually selected text to the terminal"})
(map! [n] :<c-n> ":<c-u>ToggleTerm direction=vertical<cr>" {:desc "Toggle $TERM vertically"})
(map! [n] :<space>ot ":<c-u>ToggleTerm direction=tab<cr>" {:desc "Open $TERM in a new tab"})
(map! [n] :<space>rp
  (fn f []
  (: (: (. (require :toggleterm.terminal) :Terminal) :new
        {:cmd :python3
         :direction :horizontal
         :close_on_exit true
         :on_open (fn [_]
                    (vim.notify "Run python3" vim.log.levels.INFO))})
     :toggle))
  {:desc "Run python3 in a terminal"})

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

; https://github.com/nvim-telescope/telescope.nvim
(map! [n] :<space>. "<cmd>Telescope find_files<cr>" {:desc "List files in current directory"})
(map! [n] :<space>g "<cmd>Telescope grep_string<cr>" {:desc "Searches for the string under your cursor in your current working directory"})
(map! [n] :<space>G "<cmd>Telescope live_grep<cr>" {:desc "Search for a string in your current directory"})
(map! [n] "<space>," "<cmd>Telescope buffers<cr>" {:desc "List open buffers"})
(map! [n] :<space>fr "<cmd>Telescope oldfiles<cr>" {:desc "Lists most recently opened files"})
(map! [n] :<space>fm "<cmd>Telescope man_pages<cr>" {:desc "Lists man page entries"})
(map! [n] :<space>fh "<cmd>Telescope help_tags<cr>" {:desc "List available help tags"})
(map! [n] :<space>fH "<cmd>Telescope highlights<cr>" {:desc "List available highlights"})
(map! [n] :<space>K "<cmd>Telescope lsp_references<cr>" {:desc "Lists LSP references for the work under the cursor"})
(map! [n] :<space>fd "<cmd>Telescope diagnostics<cr>" {:desc "Lists diagnostics for all open buffers"})
(map! [n] :<space>i "<cmd>Telescope lsp_implementations<cr>" {:desc "Lists implementations of the work under the cursor"})
(map! [n] :<space>fn
  (fn []
    ((. (require :telescope.builtin) :find_files)
      ((. (require :telescope.themes) :get_ivy) {
      :border true
      :borderchars {:preview ["─"
                              "│"
                              "─"
                              "│"
                              "┌"
                              "┐"
                              "┘"
                              "└"]
                    :prompt ["ㅡ"]
                    :results ["ㅡ"
                              " "
                              "ㅡ"
                              " "
                              " "
                              " "
                              " "
                              " "]}
  :layout_config {:prompt_position :top
                  :mirror false
                  :height 0.4}
  :layout_strategy :bottom_pane
  :cwd "~/.config/nvim"
  :prompt ""
  :prompt_prefix "[nvim config files]: "
  :shorten_path true
  :sorting_strategy :ascending})))
  {:desc "List Neovim config files"})
