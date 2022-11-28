(var g vim.g)

; Global settings
(set g.vimsyn_embed "lP")

; Custom globals
(set g.backupdir (vim.fn.expand (.. (vim.fn.stdpath "data") "/backup//")))
(set g.is_mac (= 1 (vim.fn.has "macunix")))
(set g.is_linux (and (vim.fn.has "unix") (not (vim.fn.has "macunix"))))
(set g.sessiondir (.. (vim.fn.stdpath "data") "/sessions"))
(set g._indent_blankline true)

; Create session directory
(os.execute (.. "mkdir -p " g.sessiondir))

; Plugin globals

; https://github.com/mhinz/vim-startify
(set g.startify_session_dir g.sessiondir)
(set g.ascii ["                __"
              " .-----..--.--.|__|.--------."
              " |     ||  |  ||  ||        |"
              " |__|__| \\___/ |__||__|__|__|"
              " "])
(set g.startify_custom_header "startify#pad(g:ascii + startify#fortune#boxed())")
(set g.startify_lists [{"header" ["   Sessions"]
                        "type" "sessions"}
                       {"header" ["   Bookmarks"]
                        "type" "bookmarks"}
                       {"header" ["   Commands"]
                        "type" "commands"}])
(set g.startify_bookmarks [])
(set g.startify_commands [])

; https://github.com/jdhao/better-escape.vim
(set g.better_escape_shortcut "jj")
(set g.better_escape_interval 200)

; https://github.com/SirVer/ultisnips
(set g.UltiSnipsSnippetDirectories [ "UltiSnips" "snips" ])
(set g.UltiSnipsJumpForwardTrigger "<c-j>")
(set g.UltiSnipsJumpBackwardTrigger "<c-k>")

; https://github.com/preservim/vim-markdown
(set g.vim_markdown_folding_disabled 1)

; https://github.com/jdhao/whitespace.nvim
(set g.trailing_whitespace_exclude_filetypes ["git"])

; https://github.com/norcalli/nvim-colorizer.lua
(set vim.opt.termguicolors true)

; https://github.com/iamcco/markdown-preview.nvim
(set g.mkdp_auto_start 0)
(set g.mkdp_auto_close 1)
(set g.mkdp_refresh_slow 0)
(set g.mkdp_command_for_global 0)
(set g.mkdp_open_to_the_world 1)
(set g.mkdp_open_ip "") ; See: https://github.com/iamcco/markdown-preview.nvim/pull/9
(set g.mkdp_browser "")
(set g.mkdp_echo_preview_url 0)
(set g.mkdp_browserfunc "")
(set g.mkdp_theme "light") ; 'dark' | 'light' | '' (Defined based on system preference)

; https://github.com/simnalamburt/vim-mundo
(set g.mundo_width 50)
(set g.mundo_preview_height 15)
(set g.mundo_preview_bottom 1)
(set g.mundo_right 1)
(set g.mundo_playback_delay 60)

; https://github.com/Olical/conjure/wiki/Quick-start:-Fennel-(Aniseed)
(vim.cmd "let g:conjure#client#fennel#aniseed#aniseed_module_prefix = \"aniseed.\"")
