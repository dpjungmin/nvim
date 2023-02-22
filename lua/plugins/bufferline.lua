require('bufferline').setup {
  options = {
    mode = 'buffers',
    numbers = 'none',
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
    sort_by = function(buffer_a, buffer_b)
      -- print(vim.inspect(buffer_a))
      return buffer_a.id > buffer_b.id
    end,
  },
}
