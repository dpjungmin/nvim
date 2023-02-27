local colors = {
  none = 'None',
  fg = '#b5b9b6',
  bg = '#2a2e33',
  selected = '#8ac361',
  modified = '#f69d50',
  hint = '#768390',
  info = '#539bf5',
  warn = '#c69026',
  error = '#e5534b',
}

local highlights = {
  fill = {
    fg = colors.none,
    bg = colors.none,
  },

  background = {
    fg = colors.fg,
    bg = colors.bg,
  },

  -- tab = {
  --   fg = '<colour-value-here>',
  --   bg = '<colour-value-here>',
  -- },
  -- tab_selected = {
  --   fg = tabline_sel_bg,
  --   bg = '<colour-value-here>',
  -- },
  -- tab_close = {
  --   fg = '<colour-value-here>',
  --   bg = '<colour-value-here>',
  -- },
  -- close_button = {
  --   fg = '<colour-value-here>',
  --   bg = '<colour-value-here>',
  -- },
  -- close_button_visible = {
  --   fg = '<colour-value-here>',
  --   bg = '<colour-value-here>',
  -- },
  -- close_button_selected = {
  --   fg = '<colour-value-here>',
  --   bg = '<colour-value-here>',
  -- },

  buffer_visible = {
    fg = colors.selected,
    bg = colors.bg,
    bold = true,
  },
  buffer_selected = {
    fg = colors.selected,
    bg = colors.bg,
    bold = true,
  },

  numbers = {
    fg = colors.fg,
    bg = colors.bg,
  },
  numbers_visible = {
    fg = colors.fg,
    bg = colors.bg,
    bold = true,
  },
  numbers_selected = {
    fg = colors.fg,
    bg = colors.bg,
    bold = true,
  },

  -- diagnostic = {
  --   fg = '<colour-value-here>',
  --   bg = '<colour-value-here>',
  -- },
  -- diagnostic_visible = {
  --   fg = '<colour-value-here>',
  --   bg = '<colour-value-here>',
  -- },
  -- diagnostic_selected = {
  --   fg = '<colour-value-here>',
  --   bg = '<colour-value-here>',
  --   bold = true,
  --   italic = true,
  -- },

  hint = {
    fg = colors.hint,
    bg = colors.bg,
  },
  hint_visible = {
    fg = colors.hint,
    bg = colors.bg,
    bold = true,
  },
  hint_selected = {
    fg = colors.hint,
    bg = colors.bg,
    bold = true,
  },
  hint_diagnostic = {
    fg = colors.hint,
    bg = colors.bg,
  },
  hint_diagnostic_visible = {
    fg = colors.hint,
    bg = colors.bg,
    bold = true,
  },
  hint_diagnostic_selected = {
    fg = colors.hint,
    bg = colors.bg,
    bold = true,
  },

  info = {
    fg = colors.info,
    bg = colors.bg,
  },
  info_visible = {
    fg = colors.info,
    bg = colors.bg,
    bold = true,
  },
  info_selected = {
    fg = colors.info,
    bg = colors.bg,
    bold = true,
  },
  info_diagnostic = {
    fg = colors.info,
    bg = colors.bg,
  },
  info_diagnostic_visible = {
    fg = colors.info,
    bg = colors.bg,
    bold = true,
  },
  info_diagnostic_selected = {
    fg = colors.info,
    bg = colors.bg,
    bold = true,
  },

  warning = {
    fg = colors.warn,
    bg = colors.bg,
  },
  warning_visible = {
    fg = colors.warn,
    bg = colors.bg,
    bold = true,
  },
  warning_selected = {
    fg = colors.warn,
    bg = colors.bg,
    bold = true,
  },
  warning_diagnostic = {
    fg = colors.warn,
    bg = colors.bg,
  },
  warning_diagnostic_visible = {
    fg = colors.warn,
    bg = colors.bg,
    bold = true,
  },
  warning_diagnostic_selected = {
    fg = colors.warn,
    bg = colors.bg,
    bold = true,
  },

  error = {
    fg = colors.error,
    bg = colors.bg,
  },
  error_visible = {
    fg = colors.error,
    bg = colors.bg,
    bold = true,
  },
  error_selected = {
    fg = colors.error,
    bg = colors.bg,
    bold = true,
  },
  error_diagnostic = {
    fg = colors.error,
    bg = colors.bg,
  },
  error_diagnostic_visible = {
    fg = colors.error,
    bg = colors.bg,
    bold = true,
  },
  error_diagnostic_selected = {
    fg = colors.error,
    bg = colors.bg,
    bold = true,
  },

  modified = {
    fg = colors.modified,
    bg = colors.bg,
  },
  modified_visible = {
    fg = colors.modified,
    bg = colors.bg,
  },
  modified_selected = {
    fg = colors.modified,
    bg = colors.bg,
  },

  duplicate_selected = {
    fg = colors.selected,
    bg = colors.bg,
    bold = true,
    italic = true,
  },
  duplicate_visible = {
    fg = colors.selected,
    bg = colors.bg,
    bold = true,
    italic = true,
  },
  duplicate = {
    fg = colors.fg,
    bg = colors.bg,
    italic = true,
  },

  separator_selected = {
    fg = colors.bg,
    bg = colors.bg,
  },
  separator_visible = {
    fg = colors.bg,
    bg = colors.bg,
  },
  separator = {
    fg = colors.bg,
    bg = colors.bg,
  },

  indicator_visible = {
    fg = colors.none,
    bg = colors.bg,
  },
  indicator_selected = {
    fg = colors.none,
    bg = colors.bg,
  },

  -- pick_selected = {
  --   fg = '<colour-value-here>',
  --   bg = '<colour-value-here>',
  --   bold = true,
  --   italic = true,
  -- },
  -- pick_visible = {
  --   fg = '<colour-value-here>',
  --   bg = '<colour-value-here>',
  --   bold = true,
  --   italic = true,
  -- },
  -- pick = {
  --   fg = '<colour-value-here>',
  --   bg = '<colour-value-here>',
  --   bold = true,
  --   italic = true,
  -- },
  -- offset_separator = {
  --   -- fg = win_separator_fg,
  --   -- bg = separator_background_color,
  -- },
}

require('bufferline').setup {
  highlights = highlights,
  options = {
    mode = 'buffers',
    numbers = 'ordinal',
    close_command = 'bdelete! %d',
    indicator = {
      icon = '▎',
      style = 'none', -- 'icon', 'none'
    },
    buffer_close_icon = '',
    modified_icon = ' ',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    name_formatter = function(buf)
      return buf.name
    end,
    max_name_length = 14,
    max_prefix_length = 14,
    truncate_names = true,
    tab_size = 14,
    diagnostics = 'nvim_lsp',
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(count, _, _, _)
      return '(' .. count .. ')'
    end,
    custom_filter = function(buf_number, _)
      local exclude_ft = { 'qf', 'fugitive', 'git' }
      local ft = vim.bo[buf_number].filetype
      if vim.tbl_contains(exclude_ft, ft) then
        return false
      end
      return true
    end,
    color_icons = true,
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_buffer_default_icon = false,
    show_close_icon = false,
    show_tab_indicators = false,
    show_duplicate_prefix = true,
    persist_buffer_sort = true,
    separator_style = 'thin', -- slant, slope, thick, thin
    enforce_regular_tabs = false,
    always_show_bufferline = false,
    hover = {
      enabled = true,
      delay = 200,
      reveal = { 'close' },
    },
    sort_by = 'insert_at_end',
  },
}
