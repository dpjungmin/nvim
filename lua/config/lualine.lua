--[[ https://github.com/nvim-lualine/lualine.nvim ]]

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right ='' },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      {
        'branch',
        color = { fg = '#dce7ff' },
      },
      'diff',
    },
    lualine_c = {
      {
        'filename',
        symbols = {
          modified = '[+]',
          readonly = '[-]',
          unnamed = '[No Name]',
        },
        color = { fg = '#1b2733', bg = 'White' },
      },
    },
    lualine_x = {
      { 'encoding', color = { fg = '#dce7ff' }},
      {
        'fileformat',
        symbols = {
          unix = 'unix',
          dos = 'win',
          mac = 'mac'
        },
        color = { fg = '#dce7ff' },
      },
      {
        'filetype',
        color = { fg = '#0a192f', bg = '#dce7ff' },
      },
    },
    lualine_y = {
      { 'progress', color = { fg = '#dce7ff' }},
    },
    lualine_z = {
      'location',
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        sections = { 'error', 'warn', 'info', 'hint' },
        diagnostics_color = {
          error = 'DiagnosticError',
          warn = 'DiagnosticWarn',
          info = 'DiagnosticInfo',
          hint = 'DiagnosticHint',
        },
        symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
      },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = { 'quickfix', 'fugitive', 'nvim-tree', 'toggleterm' },
}
