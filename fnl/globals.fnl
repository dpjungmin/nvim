(import-macros {: set!} :macros)

(var g vim.g)

; Global settings
(set g.vimsyn_embed :lP)

; Globals variables
(set g.backupdir (vim.fn.expand (.. (vim.fn.stdpath :data) :/backup//)))
(set g.is_mac (= 1 (vim.fn.has :macunix)))
(set g.is_linux (and (vim.fn.has :unix) (not (vim.fn.has :macunix))))
(set g.sessiondir (.. (vim.fn.stdpath :data) :/sessions))
(set g._indent_blankline true) ; used to toggle indent-blankline

; Global functions
(global P (fn [x]
            (print (vim.inspect x))
            x))
(set _G.dp {})
(set _G.dp.indent-blankline-activate
  (fn []
    (when (not vim.g._indent_blankline)
      (lua :return))
    (when vim.g.indent_blankline_filetype_exclude
      (each [_ ft (ipairs vim.g.indent_blankline_filetype_exclude)]
        (when (= ft vim.bo.filetype)
          (lua :return))))
    (vim.cmd :IndentBlanklineEnable)))
(set _G.dp.resume-last-cursor-pos
  (fn []
    (vim.cmd "
      let ok = v:true

      if line(\"'\\\"\") > 1 && line(\"'\\\"\") <= line('$') && &ft !~# 'commit'
        let args = v:argv  \" command line arguments

        for arg in args
          if match(arg, '\\v^\\+(\\d){1,}$') != -1
            ok = false
            break
          endif
        endfor

        if ok
          execute \"normal! g`\\\"zvzz\"
        endif
      endif")))

; Create session directory
(os.execute (.. "mkdir -p " g.sessiondir))

; Global plugin configurations

; https://github.com/mhinz/vim-startify
(set g.startify_session_dir g.sessiondir)
(set g.ascii ["작은 일에도 최선을"])
; (set g.startify_custom_header "startify#pad(g:ascii + startify#fortune#boxed())")
(set g.startify_custom_header "startify#pad(g:ascii)")
(set g.startify_lists
     [{:header ["   sessions"] :type :sessions}
      {:header ["   bookmarks"] :type :bookmarks}
      {:header ["   commands"] :type :commands}])
(set g.startify_bookmarks [])
(set g.startify_commands [])

; https://github.com/jdhao/better-escape.vim
(set g.better_escape_shortcut :jj)
(set g.better_escape_interval 200)

; https://github.com/SirVer/ultisnips
(set g.UltiSnipsSnippetDirectories [:UltiSnips :snips])
(set g.UltiSnipsJumpForwardTrigger :<c-j>)
(set g.UltiSnipsJumpBackwardTrigger :<c-k>)

; https://github.com/preservim/vim-markdown
(set g.vim_markdown_folding_disabled 1)

; https://github.com/jdhao/whitespace.nvim
(set g.trailing_whitespace_exclude_filetypes [:git])

; https://github.com/norcalli/nvim-colorizer.lua
(set! termguicolors)

; https://github.com/iamcco/markdown-preview.nvim (see: https://github.com/iamcco/markdown-preview.nvim/pull/9)
(set g.mkdp_auto_start 0)
(set g.mkdp_auto_close 1)
(set g.mkdp_refresh_slow 0)
(set g.mkdp_command_for_global 0)
(set g.mkdp_open_to_the_world 1)
(set g.mkdp_open_ip "")
(set g.mkdp_browser "")
(set g.mkdp_echo_preview_url 0)
(set g.mkdp_browserfunc "")
(set g.mkdp_theme :light) ; 'dark' | 'light' | '' (Defined based on system preference)

; https://github.com/Olical/conjure/wiki/Quick-start:-Fennel-(Aniseed)
(vim.cmd "let g:conjure#client#fennel#aniseed#aniseed_module_prefix = \"aniseed.\"")
