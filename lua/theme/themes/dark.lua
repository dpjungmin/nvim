local palette = require 'theme.themes.palette'

-- stylua: ignore
local colors = {
  bg               = palette.base00,
  fg               = palette.base05,
  comment          = palette.base03,
  const            = palette.base09,
  string           = palette.base11,
  number           = palette.base09,
  ident            = palette.base08,
  func             = palette.base13,
  keyword          = palette.base14,
  conditional      = palette.base05,
  operator         = palette.base05,
  preproc          = palette.base13,
  type             = palette.base10,

  diag = {
    error          = '#d95555',
    warn           = '#ffc24b',
    info           = '#acb0d0',
    hint           = '#acb0d0',
  },

  diff = {
    add            = palette.base11,
    change         = palette.base14,
    delete         = palette.base08,
    text           = palette.base06,
  },

  git = {
    add            = palette.base11,
    removed        = palette.base08,
    change         = palette.base14,
  },
}

local s = require 'theme.themes.styles'
local c = vim.tbl_extend('force', colors, palette)

-- stylua: ignore
return {
  -- [[ Syntax ]]

  Comment = { fg = c.comment, style = s.comment },
  Constant = { fg = c.const, style = s.constant },
  String = { fg = c.string, style = s.string }, -- 'Hello!'
  Character = { link = 'String' }, -- 'c', '\n'

  Number = { fg = c.number, style = s.number }, -- 234, 0xa5
  Float = { link = 'Number' }, -- 5.3, 9e10
  Boolean = { link = 'Number' }, -- true, false

  Identifier = { fg = c.ident }, -- variable name
  Function = { fg = c.func }, -- function name and methods for classes

  Statement = { fg = c.keyword },
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

  Special = { fg = c.func },
  SpecialChar = { link = 'Special' },
  Tag = { link = 'Special' },
  Delimiter = { link = 'Special' },
  SpecialComment = { link = 'Special' },
  Debug = { link = 'Special' },

  Underlined = { style = 'underline' },
  Bold = { style = 'bold' },
  Italic = { style = 'italic' },

  Error = { fg = c.diag.error },
  Todo = { fg = c.base09, bg = c.base07 },

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

  ColorColumn = { bg = c.base01 }, -- color for column set with 'set colorcolumn'
  Conceal = { fg = c.base03 }, -- placeholder characters substituted for concealed text (see 'conceallevel')

  Cursor = { fg = c.bg, bg = '#00c918' }, -- cursor in normal mode
  Cursor2 = { fg = 'red', bg = 'red' }, -- cursor in insert mode
  lCursor = { link = 'Cursor' },
  CursorIM = { link = 'Cursor' },
  CursorLine = { bg = c.base01 },
  CursorColumn = { link = 'CursorLine' },

  DiffAdd = { bg = c.diff.add },
  DiffChange = { bg = c.diff.change },
  DiffDelete = { bg = c.diff.delete },
  DiffText = { bg = c.diff.text }, -- changed text within a changed line

  Directory = { fg = c.base13 }, -- directory names
  EndOfBuffer = { fg = c.base01 }, -- filler lines (~) after the end of the buffer
  ErrorMsg = { fg = c.diag.error }, -- error messages on the command line
  VertSplit = { fg = c.bg }, -- the column separating vertically split windows

  -- TermCursor       = {}, -- cursor in a focused terminal
  -- TermCursorNC     = {}, -- cursor in an unfocused terminal

  Folded = { fg = c.base05, bg = c.base02 }, -- line used for closed folds
  FoldColumn = { fg = c.base05 },

  SignColumn = { fg = c.bg }, -- column where `signs` are displayed
  SignColumnSB = { link = 'SignColumn' },

  Substitute = { fg = c.base01, bg = c.diag.error }, -- `:substitute` replacement text highlighting
  LineNr = { fg = c.base05 },
  CursorLineNr = { fg = c.diag.warn, style = 'bold' }, -- shows when `cursorline` is set

  MatchParen = { fg = c.diag.warn, style = { 'reverse', 'bold' } }, -- `:h pi_paren.txt`
  ModeMsg = { fg = c.diag.warn, style = 'bold' }, -- 'showmode' message
  -- MsgArea          = {},
  -- MsgSeparator     = {},
  MoreMsg = { fg = c.diag.info, style = 'bold' }, -- `h: more-prompt`
  NonText = { fg = c.base03 },

  Normal = { fg = c.fg, bg = c.bg },
  NormalNC = { fg = c.fg, bg = c.base01 }, -- normal text in non-current windows

  NormalFloat = { fg = c.fg, bg = '#3c3836' },
  FloatBorder = { fg = 'LightGreen' },

  Pmenu = { fg = c.fg, bg = c.base01 }, -- popup menu (normal item)
  PmenuSel = { bg = c.base02 }, -- popup menu (selected item)
  PmenuSbar = { link = 'Pmenu' }, -- popup menu (scroll bar)
  PmenuThumb = { bg = c.base02 }, -- popup menu (thumb of the scroll bar)

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

  StatusLine = { fg = c.base05, bg = c.base01 },
  StatueLineNC = { fg = c.base06, bg = c.base01 }, -- statue line of not-current windows (Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window)

  TabLine = { fg = c.base05, bg = c.base01 },
  TabLineFill = { bg = c.base01 },
  TabLineSel = { fg = c.base06, bg = c.base01 },

  Title = { fg = c.func },

  Visual = { bg = c.base01 },
  VisualNOS = { link = 'Visual' },

  WarningMsg = { fg = c.diag.warn },
  Whitespace = { fg = c.base02 }, -- 'nbsp', 'space', 'tab' and 'trail' in 'listchars'
  WildMenu = { link = 'Pmenu' }, -- current match in 'wildmenu' completion
  WinBar = { fg = c.base05, bg = c.base01, style = 'bold' }, -- window bar of current window
  WinBarNC = { fg = c.base05, bg = c.base02, style = 'bold' }, -- window bar of not-current windows

  -- qfLineNr        = {},
  -- qfFileName      = {},

  -- debugPC         = {}, -- used for highlighting the current line in terminal-debug
  -- debugBreakpoint = {}, -- used for breakpoint colors in terminal-debug

  diffAdded = { fg = c.git.add },
  diffRemoved = { fg = c.git.removed },
  diffChanged = { fg = c.git.changed },
  diffOldFile = { fg = c.diag.warn },
  diffNewFile = { fg = c.diag.hint },
  diffFile = { fg = c.diag.info },
  -- diffLine         = {}, -- NOTE: not sure what this really is
  -- diffIndexLine    = {}, -- NOTE: not sure what this really is

  -- [[ Custom highlights ]]

  YankColor = { bg = '#2ecc71' },

  -- [[ Plugins ]]

  -- https://github.com/lewis6991/gitsigns.nvim
  GitSignsAdd = { fg = c.base11, bg = 'NONE' },
  GitSignsChange = { fg = c.base14, bg = 'NONE' },
  GitSignsDelete = { fg = c.base08, bg = 'NONE' },

  -- https://github.com/lukas-reineke/indent-blankline.nvim
  IndentBlanklineChar = { fg = c.base01 },
  IndentBlanklineContextChar = { fg = c.base01 },
  IndentBlanklineSpaceChar = { fg = c.base01 },
  IndentBlanklineSpaceCharBlankline = { fg = c.base01 },

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
  -- TelescopeBorder         = { fg = spec.bg4 },
  -- TelescopeSelectionCaret = { fg = spec.diag.hint },
  -- TelescopeSelection      = { link = "CursorLine" },
  -- TelescopeMatching       = { link = "Search" },
}
