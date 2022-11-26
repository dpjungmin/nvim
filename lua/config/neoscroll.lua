--[[ https://github.com/karb94/neoscroll.nvim ]]

require('neoscroll').setup {
  hide_cursor = true,
  stop_eof = true,
  use_local_scrolloff = false,
  respect_scrolloff = false,
  cursor_scrolls_alone = true,
  easing_function = 'quadratic',
  pre_hook = nil,
  post_hook = nil,
  performance_mode = false,
}

-- t[keys] = { function, { function arguments }}
local t = {}

t['<c-u>'] = { 'scroll', { '-vim.wo.scroll', 'true', '20', [['cubic']] } }
t['<c-d>'] = { 'scroll', { 'vim.wo.scroll', 'true', '20', [['cubic']] } }
t['<s-b>'] = { 'scroll', { '-vim.api.nvim_win_get_height(0)', 'true', '50', [['cubic']] } }
t['<s-f>'] = { 'scroll', { 'vim.api.nvim_win_get_height(0)', 'true', '50', [['cubic']] } }
t['<s-y>'] = { 'scroll', { '-0.10', 'false', '100', nil } }
t['<s-e>'] = { 'scroll', { '0.10', 'false', '100', nil } }
t['zt'] = { 'zt', { '10' } }
t['zz'] = { 'zz', { '10' } }
t['zb'] = { 'zb', { '10' } }

require('neoscroll.config').set_mappings(t)
