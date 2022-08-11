local palette = require 'theme.themes.palette'

-- stylua: ignore
local colors = {
  bg0         = '#0a0b0c',
  bg1         = '#1d1f21', -- default background
  bg2         = '#282A2E',
  bg3         = '#393e46',

  fg0         = '#fbfbfb',
  fg1         = '#ccd6f6', -- default foreground
  fg2         = '#a8b2d1',
  fg3         = '#8892b0',

  comment     = '#fe8019',
  cursor      = '#00ff00',
  const       = '#fbfbfb',
  char        = '#c9d05c',
  string      = '#b8bb26',
  number      = '#d65d0e',
  ident       = '#fbfbfb',
  func        = '#83a598',
  keyword     = '#d3869b',
  conditional = '#fbfbfb',
  operator    = '#fbfbfb',
  preproc     = '#fb4934',
  type        = '#fabd2f',
  buf         = '#e1acff', -- current buffer
  yank        = '#2ecc71',
  inlay_hints = '#d5c4a1',
  match       = '#f4468f',

  pmenu = {
    sel = {
      fg     = '#885df1',
      bg     = '#f5f2fe',
    },
  },

  diag = {
    error     = '#fb4934',
    warn      = '#fabd2f',
    info      = '#78c1ff',
    hint      = '#acb0d0',
  },

  diff = {
    add       = '#b8bb26',
    change    = '#e1acff',
    delete    = '#fb4934',
    text      = '#fbfbfb',
    changed   = '#e1acff',
    removed   = '#fb4934',
  },

  git = {
    add       = '#b8bb26',
    change    = '#e1acff',
    delete    = '#fb4934',
  },

  telescope = {
    border    = '#393e46',
    preview = {
      border  = '',
    }
  }
}

local s = require 'theme.themes.styles'
local c = vim.tbl_extend('force', colors, palette)

return {
  -- [[ Syntax ]]

  Comment = { fg = c.comment, style = s.comment },
  Constant = { fg = c.const, style = s.constant },
  Character = { fg = c.char, style = s.string }, -- 'c', '\n'
  String = { fg = c.string, style = s.string }, -- "Hello!"

  Number = { fg = c.number, style = s.number }, -- 234, 0xa5
  Float = { link = 'Number' }, -- 5.3, 9e10
  Boolean = { link = 'Number' }, -- true, false

  Identifier = { fg = c.ident }, -- variable name
  Function = { fg = c.func }, -- function name and methods for classes

  Statement = { fg = c.cursor },
  Conditional = { fg = c.conditional, style = s.conditional }, -- if-else, switch
  Repeat = { link = 'Conditional' }, -- for, while
  Label = { link = 'Conditional' }, -- case, default

  Operator = { fg = c.operator }, -- +, -, *
  Keyword = { fg = c.keyword },
  Exception = { link = 'Keyword' }, -- try, catch, throw

  PreProc = { fg = c.preproc }, -- preprocessor
  Include = { link = 'PreProc' },
  Define = { link = 'PreProc' },
  Macro = { link = 'PreProc' },
  PreCondit = { link = 'PreProc' },

  Type = { fg = c.type }, -- int, long, char
  StorageClass = { link = 'Type' }, -- static, register, volatile
  Structure = { link = 'Type' }, -- struct, union, enum

  Special = { fg = c.fg0 },
  SpecialChar = { link = 'Special' },
  Tag = { link = 'Special' },
  SpecialComment = { link = 'Special' },
  Debug = { link = 'Special' },
  Delimiter = { fg = c.fg2 },

  Underlined = { style = 'underline' },
  Bold = { style = 'bold' },
  Italic = { style = 'italic' },

  Error = { fg = c.diag.error },
  Todo = { fg = c.fg1, bg = c.diag.warn },

  -- qfLineNr         = {},
  -- qfFileName       = {},
  -- htmlH1           = {},
  -- htmlH2           = {},

  -- mkdHeading       = {},
  -- mkdCode          = {},
  -- mkdCodeDelimiter = {},
  -- mkdCodeStart     = {},
  -- mkdCodeEnd       = {},
  -- mkdLink          = {},

  -- markdownHeadingDelimiter = {},
  -- markdownCode             = {},
  -- markdownCodeBlock        = {},
  -- markdownH1               = {},
  -- markdownH2               = {},
  -- markdownLinkText         = {},

  -- [[ Editor ]]

  ColorColumn = { bg = c.bg2 }, -- color for column set with 'set colorcolumn'
  Conceal = { fg = c.bg2 }, -- placeholder characters substituted for concealed text (see 'conceallevel')

  Cursor = { fg = c.bg1, bg = c.cursor }, -- cursor in normal mode
  Cursor2 = { fg = 'red', bg = 'red' }, -- cursor in insert mode
  lCursor = { link = 'Cursor' },
  CursorIM = { link = 'Cursor' },
  CursorLine = { bg = c.bg2 },
  CursorColumn = { link = 'CursorLine' },

  DiffAdd = { bg = c.diff.add },
  DiffChange = { bg = c.diff.change },
  DiffDelete = { bg = c.diff.delete },
  DiffText = { bg = c.diff.text }, -- changed text within a changed line

  Directory = { fg = c.diag.info }, -- directory names
  EndOfBuffer = { fg = c.bg3 }, -- filler lines (~) after the end of the buffer
  ErrorMsg = { fg = c.diag.error }, -- error messages on the command line
  VertSplit = { fg = c.bg3 }, -- the column separating vertically split windows

  -- TermCursor       = {}, -- cursor in a focused terminal
  -- TermCursorNC     = {}, -- cursor in an unfocused terminal
  Folded = { fg = c.buf, bg = c.bg2, style = s.folded }, -- line used for closed folds
  FoldColumn = { fg = c.fg1 },

  SignColumn = { fg = c.bg1 }, -- column where `signs` are displayed
  SignColumnSB = { link = 'SignColumn' },

  Substitute = { fg = c.bg3, bg = c.diag.error }, -- `:substitute` replacement text highlighting
  LineNr = { fg = c.fg3 },
  CursorLineNr = { fg = c.diag.warn, style = 'bold' }, -- shows when `cursorline` is set

  MatchParen = { fg = c.diag.warn, style = { 'reverse', 'bold' } }, -- `:h pi_paren.txt`
  ModeMsg = { fg = c.diag.warn, style = 'bold' }, -- 'showmode' message
  -- MsgArea          = {},
  -- MsgSeparator     = {},
  MoreMsg = { fg = c.diag.info, style = 'bold' }, -- `h: more-prompt`
  NonText = { fg = c.fg3 },

  Normal = { fg = c.fg, bg = c.bg1 },
  NormalNC = { fg = c.fg, bg = c.bg1 }, -- normal text in non-current windows

  NormalFloat = { fg = c.fg1, bg = c.bg3 },
  FloatBorder = { fg = c.bg3, bg = c.bg3 },

  Pmenu = { fg = c.fg1, bg = c.bg3 }, -- popup menu (normal item)
  PmenuSel = { fg = c.pmenu.sel.fg, bg = c.pmenu.sel.bg, style = 'bold' }, -- popup menu (selected item)
  PmenuSbar = { bg = c.bg2 }, -- popup menu (scroll bar)
  -- PmenuSbar = { link = 'Pmenu' }, -- popup menu (scroll bar)
  PmenuThumb = { bg = c.bg0 }, -- popup menu (thumb of the scroll bar)

  Question = { link = 'MoreMsg' }, -- `h: hit-enter` prompt and yes/no questions
  QuickFixLine = { link = 'CursorLine' }, -- current 'quickfix' item in the quickfix window

  Search = { style = 'reverse' }, -- `h: hlsearch`
  IncSearch = { style = 'reverse' }, -- `h: incsearch`
  CurSearch = { link = 'IncSearch' }, -- search result under cursor

  SpecialKey = { link = 'NonText' }, -- `h: hl-Whitespace`

  SpellBad = { sp = c.diag.error, style = 'undercurl' },
  SpellCap = { sp = c.diag.warn, style = 'undercurl' },
  SpellLocal = { sp = c.diag.info, style = 'undercurl' },
  SpellRare = { sp = c.diag.info, style = 'undercurl' },

  StatusLine = { fg = c.fg1, bg = c.bg2 },
  StatueLineNC = { fg = c.fg0, bg = c.bg2 }, -- statue line of not-current windows (Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window)

  TabLine = { fg = c.fg1, bg = c.bg2 },
  TabLineFill = { bg = c.bg2 },
  TabLineSel = { fg = c.fg2, bg = c.bg2 },

  Title = { fg = c.fg0 }, -- vim default title

  Visual = { bg = c.bg3 },
  VisualNOS = { link = 'Visual' },

  WarningMsg = { fg = c.diag.warn },
  Whitespace = { fg = c.fg2 }, -- 'nbsp', 'space', 'tab' and 'trail' in 'listchars'
  WildMenu = { link = 'Pmenu' }, -- current match in 'wildmenu' completion
  WinBar = { fg = c.fg1, bg = c.bg1, style = 'bold' }, -- window bar of current window
  WinBarNC = { fg = c.fg1, bg = c.bg2, style = 'bold' }, -- window bar of not-current windows

  -- qfLineNr        = {},
  -- qfFileName      = {},

  -- debugPC         = {}, -- used for highlighting the current line in terminal-debug
  -- debugBreakpoint = {}, -- used for breakpoint colors in terminal-debug

  diffAdded = { fg = c.diff.add },
  diffRemoved = { fg = c.diff.removed },
  diffChanged = { fg = c.diff.changed },
  diffOldFile = { fg = c.diag.warn },
  diffNewFile = { fg = c.diag.hint },
  diffFile = { fg = c.diag.info },
  -- diffLine         = {}, -- NOTE: not sure what this really is
  -- diffIndexLine    = {}, -- NOTE: not sure what this really is

  -- [[ Custom highlights ]]

  YankColor = { bg = c.yank },
  InlayHints = { fg = c.inlay_hints, bg = 'NONE' },
  MatchAccent = { fg = c.match, bg = 'NONE' },

  -- [[ Plugins ]]
  -- https://github.com/akinsho/bufferline.nvim
  BufferLineBackground = { fg = c.fg3, bg = c.bg1 },
  BufferLineBufferVisible = { link = 'BufferLineBackground' },
  BufferLineSeparator = { fg = c.bg1, bg = c.bg1 },
  BufferLineIndicatorSelected = { fg = c.bg1, bg = c.bg1 },
  BufferLineFill = { fg = 'NONE', bg = c.bg1 },
  BufferLineBufferSelected = { fg = c.buf, bg = c.bg1, style = 'bold' },
  BufferLineTab = { fg = c.fg3, bg = c.bg1 },
  BufferLineTabSelected = { fg = c.buf, bg = c.bg1, style = 'bold' },
  BufferLineDuplicate = { fg = c.diag.info, bg = 'NONE', style = 'italic' },
  BufferLineDuplicateVisible = { fg = c.diag.info, bg = 'NONE' },
  BufferLineDuplicateSelected = { fg = c.diag.info, bg = 'NONE', style = 'italic' },
  BufferLineHint = { fg = c.diag.hint, bg = 'NONE' },
  BufferLineHintVisible = { fg = c.diag.hint, bg = 'NONE' },
  BufferLineHintSelected = { fg = c.diag.hint, bg = 'NONE', style = 'bold' },
  BufferLineHintDiagnostic = { fg = c.diag.hint, bg = 'NONE' },
  BufferLineHintDiagnosticVisible = { fg = c.diag.hint, bg = 'NONE' },
  BufferLineHintDiagnosticSelected = { fg = c.diag.hint, bg = 'NONE', style = 'bold' },
  BufferLineInfo = { fg = c.diag.info, bg = 'NONE' },
  BufferLineInfoVisible = { fg = c.diag.info, bg = 'NONE' },
  BufferLineInfoSelected = { fg = c.diag.info, bg = 'NONE', style = 'bold' },
  BufferLineInfoDiagnostic = { fg = c.diag.info, bg = 'NONE' },
  BufferLineInfoDiagnosticVisible = { fg = c.diag.info, bg = 'NONE' },
  BufferLineInfoDiagnosticSelected = { fg = c.diag.info, bg = 'NONE', style = 'bold' },
  BufferLineWarning = { fg = c.diag.warn, bg = 'NONE' },
  BufferLineWarningVisible = { fg = c.diag.warn, bg = 'NONE' },
  BufferLineWarningSelected = { fg = c.diag.warn, bg = 'NONE', style = 'bold' },
  BufferLineWarningDiagnostic = { fg = c.diag.warn, bg = 'NONE' },
  BufferLineWarningDiagnosticVisible = { fg = c.diag.warn, bg = 'NONE' },
  BufferLineWarningDiagnosticSelected = { fg = c.diag.warn, bg = 'NONE', style = 'bold' },
  BufferLineError = { fg = c.diag.error, bg = 'NONE' },
  BufferLineErrorVisible = { fg = c.diag.error, bg = 'NONE' },
  BufferLineErrorSelected = { fg = c.diag.error, bg = 'NONE', style = 'bold' },
  BufferLineErrorDiagnostic = { fg = c.diag.error, bg = 'NONE' },
  BufferLineErrorDiagnosticVisible = { fg = c.diag.error, bg = 'NONE' },
  BufferLineErrorDiagnosticSelected = { fg = c.diag.error, bg = 'NONE', style = 'bold' },

  -- https://github.com/lewis6991/gitsigns.nvim
  GitSignsAdd = { fg = c.git.add, bg = 'NONE' },
  GitSignsChange = { fg = c.git.change, bg = 'NONE' },
  GitSignsDelete = { fg = c.git.delete, bg = 'NONE' },

  -- https://github.com/lukas-reineke/indent-blankline.nvim
  IndentBlanklineChar = { fg = c.bg3 },
  IndentBlanklineContextChar = { fg = c.bg3 },
  IndentBlanklineSpaceChar = { fg = c.bg3 },
  IndentBlanklineSpaceCharBlankline = { fg = c.bg3 },

  -- https://github.com/kyazdani42/nvim-tree.lua
  -- NvimTreeNormal           = { fg = spec.fg1, bg = config.transparent and "NONE" or spec.bg0 },
  -- NvimTreeVertSplit        = { link = "VertSplit" },
  -- NvimTreeIndentMarker     = { fg = spec.bg4 },

  -- NvimTreeRootFolder       = { fg = c.orange.base, style = "bold" },
  -- NvimTreeFolderName       = { fg = c.blue.base },
  -- NvimTreeFolderIcon       = { fg = c.blue.base },
  -- NvimTreeOpenedFolderName = { fg = c.blue:harsh() },
  -- NvimTreeEmptyFolderName  = { fg = spec.syntax.dep },
  -- NvimTreeSymlink          = { fg = c.pink:subtle() },
  -- NvimTreeSpecialFile      = { fg = c.cyan.base },
  -- NvimTreeImageFile        = { fg = c.white:subtle() },
  -- NvimTreeOpenedFile       = { fg = c.pink:harsh() }, -- TODO: not working

  -- NvimTreeGitDeleted       = { fg = spec.git.removed },
  -- NvimTreeGitDirty         = { fg = spec.git.changed},
  -- NvimTreeGitMerge         = { fg = spec.git.conflict, },
  -- NvimTreeGitNew           = { fg = spec.git.add },
  -- NvimTreeGitRenamed       = { link = "NvimTreeGitDeleted" },
  -- NvimTreeGitStaged        = { link = "NvimTreeGitStaged" },

  -- https://github.com/nvim-telescope/telescope.nvim
  TelescopeBorder = { fg = c.telescope.border },
  TelescopeSelectionCaret = { fg = c.diag.hint },
  TelescopeSelection = { fg = c.cursor, bg = c.bg1, style = 'bold' },
  TelescopeMultiSelection = { fg = c.fg1, bg = c.bg1 },
  TelescopeMatching = { link = 'MatchAccent' },
  TelescopePromptPrefix = { fg = c.buf, style = 'bold' },
}
