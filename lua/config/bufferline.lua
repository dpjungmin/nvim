--[[ https://github.com/akinsho/bufferline.nvim ]]

local buffer_groups = _G.tovim.buffer_groups
local groups = {}

for i, v in pairs(buffer_groups) do
  local group = {
    auto_close = false,
    separator = {
      style = require('bufferline.groups').separator.tab
    },
  }

  group = vim.tbl_extend('force', group, v)
  groups[i] = group
end

vim.tbl_extend('force', groups, require('bufferline.groups').builtin.ungrouped)

require('bufferline').setup {
  highlights = {
    buffer_selected = {
      gui = 'bold',
    },
  },
  options = {
    indicator_icon = '▎',
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15,
    tab_size = 10,
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
    diagnostics_indicator = function(count, _, _, context)
      if context.buffer:current() then
          return ''
      end

      return '(' .. count .. ')'
    end,
    offsets = {{ filetype = 'NvimTree', text = '📁', text_align = 'center' }},
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    separator_style = 'thin',
    sort_by = 'id',
    groups = {
      options = {
        toggle_hidden_on_enter = true,
      },
      items = groups,
    }
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
map('n', '<s-l>', '<cmd>BufferLineMoveNext<cr>', { desc = 'Move the current buffer to the next buffer position' })
map('n', '<s-h>', '<cmd>BufferLineMovePrev<cr>', { desc = 'Move the current buffer to the previous buffer position' })

for _, g in ipairs(buffer_groups) do
  map('n', g.keymapping.toggle,
  '<cmd>BufferLineGroupToggle ' .. g.name .. "<cr> \z
  <cmd>lua vim.notify('Toggle buffer-group \"" .. g.name .. "\"', vim.log.levels.INFO)<cr>",
  { desc = "Toggle buffer-group '" .. g.name .. "'" })
  map('n', g.keymapping.close,
  '<cmd>BufferLineGroupClose ' .. g.name .. "<cr> \z
  <cmd>lua vim.notify('Close buffer-group \"" .. g.name .. "\"', vim.log.levels.INFO)<cr>",
  { desc = "Close buffer-group '" .. g.name .. "'" })
end
