--[[ https://github.com/gelguy/wilder.nvim ]]

local wilder = require 'wilder'

wilder.setup { modes = { ':', '/', '?' } }

wilder.set_option('pipeline', {
  wilder.branch(
    -- Fuzzily search when getting file completions
    wilder.python_file_finder_pipeline {
      file_command = { 'rg', '--files' },
      dir_command = { 'fd', '-td' },
      filters = { 'fuzzy_filter', 'difflib_sorter' },
    },
    wilder.cmdline_pipeline(),
    wilder.python_search_pipeline()
  ),
})

wilder.set_option(
  'renderer',
  wilder.popupmenu_renderer {
    highlighter = {
      wilder.lua_fzy_highlighter(), -- requires `romgrk/fzy-lua-native`
    },
    highlights = {
      accent = 'MatchAccent',
    },
    left = { ' ', wilder.popupmenu_devicons() },
    right = { ' ', wilder.popupmenu_scrollbar() },
    pumblend = 5,
    max_height = '50%',
  }
)
