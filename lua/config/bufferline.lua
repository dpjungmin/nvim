--[[ https://github.com/akinsho/bufferline.nvim ]]

require('bufferline').setup {
  options = {
    -- indicator = {
    --   style = 'icon',
    --   icon = '▎',
    -- },
    indicator = {
      style = 'none',
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 15,
    max_prefix_length = 15,
    tab_size = 10,
    text_align = 'center',
    name_formatter = function(buf)
      return buf.name
    end,
    custom_filter = function(bufnr)
      local exclude_ft = { 'qf', 'fugitive', 'git' }
      local cur_ft = vim.bo[bufnr].filetype

      if vim.tbl_contains(exclude_ft, cur_ft) then
        return false
      end

      return true
    end,
    diagnostics = 'nvim_lsp',
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(count, _, _, _)
      return '(' .. count .. ')'
    end,
    offsets = { { filetype = 'NvimTree', text = '📁', text_align = 'center' } },
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    persist_buffer_sort = true,
    enforce_regular_tabs = false,
    always_show_bufferline = false,
    separator_style = 'thin',
    sort_by = 'id',
  },
}
