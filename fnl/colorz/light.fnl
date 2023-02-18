(import-macros {: hl!} :macros)

(local none :None)

; Custom
(hl! :YankColor {:fg none :bg "#2ecc71"})
(hl! :InlayHints {:fg "#d2e0bf" :bg none :style [:bold]})
(hl! :MatchAccent {:fg "#f15946" :bg none :style [:bold]})

; ansi = ["#000000","#ff0000","#59d600","#f0cb00","#00a2ff","#c17ecc","#00d0d6","#e6ebe1"]
; brights = ["#8f928b","#ff0013","#93ff00","#fff121","#88c9ff","#e9a7e1","#00feff","#f6f6f4"]

; Syntax
(hl! :Comment {:fg "#9da8a3" :bg none})
(hl! :Constant {:fg "#00a2ff" :bg none :style [:bold]})
(hl! :Character {:fg "#c38a61" :bg none}) ; 'c', '\n'
(hl! :String {:fg "#c38a61" :bg none}) ; "Hello!"
(hl! :Number {:fg "#c17ecc" :bg none :style [:bold]}) ; 234, 0xa5
(hl! :Float {:link :Number}) ; 5.3, 9e10
(hl! :Identifier {:fg "#ff5d16" :bg none}) ; variable name
(hl! :Function {:fg "#000000" :bg none :style [:bold]}) ; function name and methods for classes
(hl! :Statement {:fg "#59d600" :bg none}) ; local, struct, let
(hl! :Keyword {:fg "#59d600" :bg none :style [:bold]})
(hl! :Conditional {:fg "#058e3f" :bg none}) ; if-else, switch
(hl! :Repeat {:link :Conditional}) ; for, while, do-while
(hl! :Label {:link :Conditional}) ; case, default
(hl! :Operator {:fg "#c38a61" :bg none}) ; +, -, *
(hl! :Exception {:fg "#00d0d6" :bg none}) ; try, catch, throw
(hl! :Include {:fg "#ff5d16" :bg none}) ; use, import, include
(hl! :PreProc {:fg "#9da8a3" :bg none}) ; preprocessor
(hl! :Define {:fg "#59d600" :bg none})
(hl! :Macro {:fg "#c17ecc" :bg none})
(hl! :PreCondit {:fg "#e58a50" :bg none :style [:bold]})
(hl! :Type {:fg "#e58a50" :bg none :style [:bold]}) ; int, long, char
(hl! :StorageClass {:fg "#c17ecc" :bg none}) ; static, register, volatile
(hl! :Structure {:link :StorageClass}) ; struct, union, enum
(hl! :Special {:fg "#c17ecc" :bg none})
(hl! :SpecialChar {:fg "#ffffff" :bg none})
(hl! :Tag {:fg "#cad8d2" :bg none})
(hl! :SpecialComment {:fg "#9da8a3" :bg none})
(hl! :Debug {:fg "#cad8d2" :bg none})
(hl! :Delimiter {:fg "#969696" :bg none})
(hl! :Underlined {:style [:underline]})
(hl! :Bold {:style [:bold]})
(hl! :Italic {:style [:italic]})
(hl! :Todo {:fg :Red :bg none :style [:bold]})
(hl! :Error {:fg "#e5534b" :bg none :style [:undercurl]})

; Editor
(hl! :Normal {:fg "#000000" :bg none})
(hl! :NormalNC {:link :Number})
(hl! :Cursor {:fg none :bg "#00ff00"})
(hl! :Cursor2 {:fg none :bg "#ff0000"})
(hl! :lCursor {:link :Cursor})
(hl! :CursorIM {:link :Cursor})
(hl! :TermCursor {:link :Cursor})
(hl! :TermCursorNC {:fg none :bg :Orange}) ; cursor in an unfocused terminal
(hl! :LineNr {:fg "#636e7b" :bg none})
(hl! :LineNrAbove {:fg "#adbac7" :bg none})
(hl! :LineNrBelow {:fg "#adbac7" :bg none})
(hl! :CursorLine {:fg none :bg "#e8e9f3"})
(hl! :CursorLineNr {:fg "#636e7b" :bg none :style [:bold]}) ; shows when `cursorline` is set
(hl! :CursorColumn {:link :CursorLine})
(hl! :ColorColumn {:fg none :bg "#9da8a3"}) ; color for column set with 'set colorcolumn'
(hl! :Conceal {:link :Normal}) ; placeholder characters substituted for concealed text (see 'conceallevel')
(hl! :SignColumn {:fg none :bg none}) ; column where `signs` are displayed
(hl! :SignColumnSB {:link :SignColumn})
(hl! :VertSplit {:fg "#cad8d2" :bg none}) ; the column separating vertically split windows
(hl! :Title {:fg "#6cb6ff" :bg none :style [:bold]}) ; vim default title
(hl! :Visual {:fg none :bg "#c1deff"}) ; visual selection
(hl! :VisualNOS {:link :Visual})
(hl! :Search {:fg "#000000" :bg "#f0c239"})
(hl! :IncSearch {:fg "#000000" :bg "#f0c239" :style [:bold]})
(hl! :CurSearch {:link :IncSearch})
(hl! :EndOfBuffer {:fg none :bg none}) ; `~` at the end of buffer
(hl! :Whitespace {:fg "#434846"}) ; 'nbsp', 'space', 'tab' and 'trail' in 'listchars'
(hl! :NonText {:fg "#424846" :bg none})
(hl! :SpecialKey {:link :NonText})
(hl! :MatchParen {:fg none :bg "#434846"})
(hl! :Folded {:fg none :bg "#434846"})
(hl! :FoldColumn {:fg "#ffffff" :bg none})
(hl! :DiffAdd {:fg "#ffffff" :bg "#245829"})
(hl! :DiffChange {:fg "#ffffff" :bg "#c93c37"})
(hl! :DiffDelete {:fg "#ffffff" :bg "#e5545b"})
(hl! :DiffText {:fg none :bg "#46954a"})
(hl! :diffAdded {:link :DiffAdd})
(hl! :diffChanged {:link :DiffChange})
(hl! :diffRemoved {:link :DiffDelete})
(hl! :diffOldFile {:fg "#c2442d" :bg none})
(hl! :diffNewFile {:fg "#347d39" :bg none})
(hl! :diffFile {:fg "#316dca" :bg none})
(hl! :NormalFloat {:fg "#000000" :bg none})
(hl! :FloatBorder {:fg "#395756" :bg none})
(hl! :Directory {:fg "#6cb6ff" :bg ""})
(hl! :ModeMsg {:fg "#ffffff" :bg none}) ; `showmode` message
(hl! :MoreMsg {:link :ModeMsg})
(hl! :Question {:fg "#316dca" :bg none})
(hl! :QuickFixLine {:link :Visual}) ; current 'quickfix' item in the quickfix window
(hl! :Float {:fg "#6bc46d" :bg none})
(hl! :ErrorMsg {:fg "#fe5f55" :bg none}) ; error messages on the command line
(hl! :WarningMsg {:fg "#c69026" :bg none})
(hl! :Pmenu {:fg "#434846" :bg "#d8ddef"}) ; popup menu (normal item)
(hl! :PmenuSel {:fg "#434846" :bg "#a0a4b8"}) ; popup menu (selected item)
(hl! :PmenuSbar {:fg "#5a605d" :bg none}) ; popup menu (scroll bar)
(hl! :PmenuThumb {:fg "#a0a4b8" :bg none}) ; popup menu (thumb of the scroll bar)
(hl! :WildMenu {:link :Pmenu}) ; current match in 'wildmenu' completion

; Plugins

; https://github.com/lewis6991/gitsigns.nvim
(hl! :GitSignsCurrentLineBlame {:fg "#545d68" :bg none})
(hl! :GitSignsAdd {:fg "#347d39" :bg none})
(hl! :GitSignsAddInline {:fg "#ffffff" :bg "#347d39"})
(hl! :GitSignsAddLnInline {:link :GitSignsAddInline})
(hl! :GitSignsAddLnVirtLnInline {:link :GitSignsAddInline})
(hl! :GitSignsChange {:fg "#ae7c14" :bg none})
(hl! :GitSignsChangeInline {:fg "#ffffff" :bg "#ae7c14"})
(hl! :GitSignsChangeLnInline {:link :GitSignsChangeInline})
(hl! :GitSignsChangeLnVirtLnInline {:link :GitSignsChangeInline})
(hl! :GitSignsDelete {:fg "#922323" :bg none})
(hl! :GitSignsDeleteInline {:fg "#ffffff" :bg "#922323"})
(hl! :GitSignsDeleteLnInline {:link :GitSignsDeleteInline})
(hl! :GitSignsDeleteLnVirtLnInline {:link :GitSignsDeleteInline})

; https://github.com/lukas-reineke/indent-blankline.nvim
(hl! :IndentBlanklineChar {:fg "#e6ebe1" :bg none})
(hl! :IndentBlanklineContextChar {:fg "#e6ebe1" :bg none})

; https://github.com/nvim-telescope/telescope.nvim
(hl! :TelescopeBorder {:fg "#636e7b" :bg none})
(hl! :TelescopeSelectionCaret {:fg "#00a2ff" :bg none})
(hl! :TelescopeSelection {:fg "#000000" :bg "#e7e5df"})
(hl! :TelescopeMultiSelection {:link :TelescopeSelection})
(hl! :TelescopeMatching {:link :MatchAccent})
(hl! :TelescopePromptPrefix {:fg "#00a2ff" :bg none :style [:bold]})

; https://github.com/kyazdani42/nvim-tree.lua
(hl! :NvimTreeGitNew {:fg "#46954a" :bg none })
(hl! :NvimTreeGitRenamed {:fg "#ae7c14" :bg none })
(hl! :NvimTreeGitDeleted {:fg "#e5534b" :bg none })
(hl! :NvimTreeRootFolder {:fg "#000000" :bg none })
(hl! :NvimTreeSpecialFile {:fg "#000000" :bg none :style [:underline :bold]})

; https://github.com/nvim-treesitter/nvim-treesitter-context
(hl! :TreesitterContext {:fg "#000000" :bg "#e7e5df" :style [:bold]})

; https://github.com/folke/which-key.nvim
(hl! :WhichKeyBorder {:fg "#395756" :bg none})

; https://github.com/hrsh7th/nvim-cmp
(hl! :CmpItemMenu {:link :Comment})
(hl! :CmpItemAbbrDeprecated {:fg "#808080" :bg none :style [:strikethrough]})
(hl! :CmpItemAbbrMatch {:fg "#30dff3" :bg none :style [:bold]})
(hl! :CmpItemAbbrMatchFuzzy {:fg "#30dff3" :bg none :style [:bold]})
(hl! :CmpItemKindVariable {:fg "#6cb6ff" :bg none})
(hl! :CmpItemKindInterface {:link :CmpItemKindVariable})
(hl! :CmpItemKindText {:link :CmpItemKindVariable})
(hl! :CmpItemKindFunction {:fg "#b0a4e3" :bg none})
(hl! :CmpItemKindMethod {:link :CmpItemKindFunction})
(hl! :CmpItemKindKeyword {:fg "#e0f0ef" :bg none})
(hl! :CmpItemKindUnit {:link :CmpItemKindKeyword})

; https://github.com/j-hui/fidget.nvim
(hl! :FidgetTask {:fg "#555555" :bg none})
(hl! :FidgetTitle {:fg "#000000" :bg none})

; https://github.com/RRethy/vim-illuminate
(hl! :IlluminatedWordText {:fg none :bg "#e0f0ef" :style []})
(hl! :IlluminatedWordRead {:fg none :bg "#e0f0ef" :style []})
(hl! :IlluminatedWordWrite {:fg none :bg "#e0f0ef" :style []})
