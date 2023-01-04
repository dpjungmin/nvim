(import-macros {: hl!} :macros)

(local none :None)

; Custom
(hl! :YankColor {:fg none :bg "#2ecc71"})
(hl! :InlayHints {:fg "#636e7b" :bg none})
(hl! :MatchAccent {:fg "#30dff3" :bg none :style [:bold]})

; Syntax
(hl! :Comment {:fg "#9da8a3" :bg none})
(hl! :Constant {:fg "#dcbdfb" :bg none})
(hl! :Character {:fg "#ff938a" :bg none}) ; 'c', '\n'
(hl! :String {:fg "#ff938a" :bg none}) ; "Hello!"
(hl! :Number {:fg "#c38a61" :bg none}) ; 234, 0xa5
(hl! :Float {:link :Number}) ; 5.3, 9e10
(hl! :Identifier {:fg "#cad8d2" :bg none}) ; variable name
(hl! :Function {:fg "#f69d50" :bg none}) ; function name and methods for classes
(hl! :Statement {:fg "#8ac361" :bg none}) ; local, struct, let
(hl! :Keyword {:fg "#8ac361" :bg none})
(hl! :Conditional {:fg "#9ac361" :bg none}) ; if-else, switch
(hl! :Repeat {:link :Conditional}) ; for, while, do-while
(hl! :Label {:link :Conditional}) ; case, default
(hl! :Operator {:fg "#e0f0ef" :bg none}) ; +, -, *
(hl! :Exception {:fg "#30dff3" :bg none}) ; try, catch, throw
(hl! :Include {:fg "#9da8a3" :bg none}) ; use, import, include
(hl! :PreProc {:fg "#cad8d2" :bg none}) ; preprocessor
(hl! :Define {:fg "#8ac361" :bg none})
(hl! :Macro {:fg "#f0c239" :bg none})
(hl! :PreCondit {:fg "#f0c239" :bg none})
(hl! :Type {:fg "#f0c239" :bg none}) ; int, long, char
(hl! :StorageClass {:fg "#8ac361" :bg none}) ; static, register, volatile
(hl! :Structure {:link :StorageClass}) ; struct, union, enum
(hl! :Special {:fg "#8ac361" :bg none})
(hl! :SpecialChar {:fg "#ffffff" :bg none})
(hl! :Tag {:fg "#cad8d2" :bg none})
(hl! :SpecialComment {:fg "#9da8a3" :bg none})
(hl! :Debug {:fg "#cad8d2" :bg none})
(hl! :Delimiter {:fg "#ecf6f2" :bg none})
(hl! :Underlined {:style [:underline]})
(hl! :Bold {:style [:bold]})
(hl! :Italic {:style [:italic]})
(hl! :Todo {:fg :Red :bg none :style [:bold]})
(hl! :Error {:fg "#e5534b" :bg none :style [:undercurl]})

; treesitter
(hl! :TSTag {:link :Tag})
; -- TSNote = { fg = p.orange, bg = c.none, style = 'bold' },
; -- TSType = { fg = p.red, bg = c.none },
; -- TSError = { link = 'Error' },
; -- TSFunction = { link = 'Function' },
; -- TSFuncMacro = { c.cursor, bg = c.none },
; -- TSFuncBuiltin = { fg = c.cursor, bg = c.none },
; -- TSFunctionCall = { fg = c.cursor, bg = c.none },
; -- TSConstBuiltin = { fg = c.orange, bg = c.none },
; -- TSTypeBuiltin = { fg = c.warn, bg = c.none },
; -- TSField = { fg = c.light_blue, bg = c.none },
; -- TSMethodCall = { fg = c.light_blue, bg = c.none },
; -- TSAttribute = { fg = c.warn, bg = c.none },
; -- TSNamespace = { fg = c.light_blue, bg = c.none },

; Editor
(hl! :Normal {:fg "#ffffff" :bg none})
(hl! :NormalNC {:link :Number})
(hl! :Cursor {:fg none :bg "#00ff00"})
(hl! :Cursor2 {:fg none :bg "#ff0000"})
(hl! :lCursor {:link :Cursor})
(hl! :CursorIM {:link :Cursor})
(hl! :TermCursor {:link :Cursor})
(hl! :TermCursorNC {:fg none :bg :Orange}) ; cursor in an unfocused terminal
(hl! :LineNr {:fg "#adbac7" :bg none})
(hl! :LineNrAbove {:fg "#636e7b" :bg none})
(hl! :LineNrBelow {:fg "#636e7b" :bg none})
(hl! :CursorLine {:fg none :bg "#373e47"})
(hl! :CursorLineNr {:fg "#adbac7" :bg none :style [:bold]}) ; shows when `cursorline` is set
(hl! :CursorColumn {:link :CursorLine})
(hl! :ColorColumn {:fg none :bg "#2d302f"}) ; color for column set with 'set colorcolumn'
(hl! :Conceal {:link :Normal}) ; placeholder characters substituted for concealed text (see 'conceallevel')
(hl! :SignColumn {:fg none :bg none}) ; column where `signs` are displayed
(hl! :SignColumnSB {:link :SignColumn})
(hl! :VertSplit {:fg "#444c56" :bg none}) ; the column separating vertically split windows
(hl! :Title {:fg "#6cb6ff" :bg none :style [:bold]}) ; vim default title
(hl! :Visual {:fg none :bg "#434846"}) ; visual selection
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
(hl! :DiffAdd {:fg none :bg "#245829"})
(hl! :DiffChange {:fg none :bg "#c93c37"})
(hl! :DiffDelete {:fg none :bg "#922323"})
(hl! :DiffText {:fg none :bg "#347d39"})
(hl! :diffAdded {:link :DiffAdd})
(hl! :diffChanged {:link :DiffChange})
(hl! :diffRemoved {:link :DiffDelete})
(hl! :diffOldFile {:fg "#c2442d" :bg none})
(hl! :diffNewFile {:fg "#347d39" :bg none})
(hl! :diffFile {:fg "#316dca" :bg none})
(hl! :NormalFloat {:fg "#ecf6f2" :bg none})
(hl! :FloatBorder {:fg "#cad8d2" :bg none})
(hl! :Directory {:fg "#6cb6ff" :bg ""})
(hl! :ModeMsg {:fg "#ffffff" :bg none}) ; `showmode` message
(hl! :MoreMsg {:link :ModeMsg})
(hl! :Question {:fg "#316dca" :bg none})
(hl! :QuickFixLine {:link :Visual}) ; current 'quickfix' item in the quickfix window
(hl! :Float {:fg "#6bc46d" :bg none})
(hl! :ErrorMsg {:fg "#e5534b" :bg none}) ; error messages on the command line
(hl! :WarningMsg {:fg "#c69026" :bg none})
(hl! :Pmenu {:fg "#ecf6f2" :bg "#434846"}) ; popup menu (normal item)
(hl! :PmenuSel {:fg "#ecf6f2" :bg "#404b82"}) ; popup menu (selected item)
(hl! :PmenuSbar {:fg none :bg "#5a605d"}) ; popup menu (scroll bar)
(hl! :PmenuThumb {:fg none :bg "#ecf6f2"}) ; popup menu (thumb of the scroll bar)
(hl! :WildMenu {:link :Pmenu}) ; current match in 'wildmenu' completion

; Plugins

; https://github.com/lewis6991/gitsigns.nvim
(hl! :GitSignsCurrentLineBlame {:fg "#545d68" :bg none})
(hl! :GitSignsAdd {:fg "#46954a" :bg none})
(hl! :GitSignsAddInline {:fg "#ffffff" :bg "#46954a"})
(hl! :GitSignsAddLnInline {:link :GitSignsAddInline})
(hl! :GitSignsAddLnVirtLnInline {:link :GitSignsAddInline})
(hl! :GitSignsChange {:fg "#ae7c14" :bg none})
(hl! :GitSignsChangeInline {:fg "#ffffff" :bg "#ae7c14"})
(hl! :GitSignsChangeLnInline {:link :GitSignsChangeInline})
(hl! :GitSignsChangeLnVirtLnInline {:link :GitSignsChangeInline})
(hl! :GitSignsDelete {:fg "#e5534b" :bg none})
(hl! :GitSignsDeleteInline {:fg "#ffffff" :bg "#e5534b"})
(hl! :GitSignsDeleteLnInline {:link :GitSignsDeleteInline})
(hl! :GitSignsDeleteLnVirtLnInline {:link :GitSignsDeleteInline})

; https://github.com/lukas-reineke/indent-blankline.nvim
(hl! :IndentBlanklineChar {:fg "#434846" :bg none})
(hl! :IndentBlanklineContextChar {:fg "#534846" :bg none})

; https://github.com/nvim-telescope/telescope.nvim
(hl! :TelescopeBorder {:fg "#636e7b" :bg none})
(hl! :TelescopeSelectionCaret {:fg "#30dff3" :bg none})
(hl! :TelescopeSelection {:fg "#ffffff" :bg "#434846"})
(hl! :TelescopeMultiSelection {:link :TelescopeSelection})
(hl! :TelescopeMatching {:link :MatchAccent})
(hl! :TelescopePromptPrefix {:fg "#30dff3" :bg none :style [:bold]})

; -- https://github.com/kyazdani42/nvim-tree.lua
; NvimTreeGitNew = { fg = c.editor.git.added_resource_foreground, bg = c.none },
; NvimTreeGitRenamed = { fg = c.editor.git.modified_resource_foreground, bg = c.none },
; NvimTreeRootFolder = { fg = c.editor.foreground, bg = c.none },
; NvimTreeGitDeleted = { fg = c.editor.git.deleted_resource_foreground, bg = c.none },
; NvimTreeSpecialFile = { fg = c.editor.foreground, bg = c.none, style = { 'underline', 'bold' } },

; -- https://github.com/nvim-treesitter/nvim-treesitter-context
(hl! :TreesitterContext {:fg "#ffffff" :bg "#434846" :style [:bold]})

; https://github.com/folke/which-key.nvim
(hl! :WhichKeyBorder {:fg "#aaaaaa" :bg none})

; -- https://github.com/hrsh7th/nvim-cmp
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
(hl! :FidgetTask {:fg "#aaaaaa" :bg none})
(hl! :FidgetTitle {:fg "#ffffff" :bg none})

; https://github.com/RRethy/vim-illuminate
(hl! :IlluminatedWordText {:fg none :bg "#373e47" :style []})
(hl! :IlluminatedWordRead {:fg none :bg "#373e47" :style []})
(hl! :IlluminatedWordWrite {:fg none :bg "#373e47" :style []})
