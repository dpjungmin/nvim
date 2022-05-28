--[[ https://github.com/akinsho/bufferline.nvim ]]

require('bufferline').setup {
  options = {
    indicator_icon = '▎',
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
    show_tab_indicators = true,
    persist_buffer_sort = true,
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    separator_style = 'thin',
    sort_by = 'id',
  },
}

local map = require('lib.utils').map

map('n', '<space>1', '<cmd>BufferLineGoToBuffer 1<cr>', { desc = 'Go to buffer 1' })
map('n', '<space>2', '<cmd>BufferLineGoToBuffer 2<cr>', { desc = 'Go to buffer 2' })
map('n', '<space>3', '<cmd>BufferLineGoToBuffer 3<cr>', { desc = 'Go to buffer 3' })
map('n', '<space>4', '<cmd>BufferLineGoToBuffer 4<cr>', { desc = 'Go to buffer 4' })
map('n', '<space>5', '<cmd>BufferLineGoToBuffer 5<cr>', { desc = 'Go to buffer 5' })
map('n', '<space>6', '<cmd>BufferLineGoToBuffer 6<cr>', { desc = 'Go to buffer 6' })
map('n', '<space>7', '<cmd>BufferLineGoToBuffer 7<cr>', { desc = 'Go to buffer 7' })
map('n', '<space>8', '<cmd>BufferLineGoToBuffer 8<cr>', { desc = 'Go to buffer 8' })
map('n', '<space>9', '<cmd>BufferLineGoToBuffer 9<cr>', { desc = 'Go to buffer 9' })
map('n', '<tab>', '<cmd>BufferLineCycleNext<cr>', { desc = 'Go to the next buffer' })
map('n', '<s-tab>', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Go to the previous buffer' })
map(
  'n',
  '<s-l>',
  '<cmd>BufferLineMoveNext<cr>',
  { desc = 'Move the current buffer to the next buffer position' }
)
map(
  'n',
  '<s-h>',
  '<cmd>BufferLineMovePrev<cr>',
  { desc = 'Move the current buffer to the previous buffer position' }
)
