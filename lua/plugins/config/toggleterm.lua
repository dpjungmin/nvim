--[[ https://github.com/akinsho/toggleterm.nvim ]]

local shell = _G.config.shell or 'bash'

require('toggleterm').setup {
  shell = shell,
  open_mapping = '<c-\\>',
  size = function(term)
    if term.direction == 'horizontal' then
      return 25
    elseif term.direction == 'vertical' then
      return vim.o.columns * 0.4
    end
  end,
  shade_terminals = true,
  shading_factor = 2,
  hide_numbers = true,
  start_in_insert = true,
  close_on_exit = true,
  direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float'
  float_opts = {
    border = 'single', -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    winblend = 10,
  },
}

local map = require('lib.utils').map

map('t', '<esc>', '<c-\\><c-n>', { desc = 'Go from Insert mode to Normal mode' })
map('t', '<c-h>', '<c-\\><c-n><c-w>h', { desc = 'Move left (window)' })
map('t', '<c-j>', '<c-\\><c-n><c-w>j', { desc = 'Move down (window)' })
map('t', '<c-k>', '<c-\\><c-n><c-w>k', { desc = 'Move up (window)' })
map('t', '<c-l>', '<c-\\><c-n><c-w>l', { desc = 'Move right (window)' })
map(
  'v',
  '<leader>s',
  ':ToggleTermSendVisualSelection<cr>',
  { desc = 'Send the visually selected text to the terminal' }
)

-- Toggle terminal
map('n', '<c-n>', ':<c-u>ToggleTerm direction=vertical<cr>', { desc = 'Toggle $TERM vertically' })
map('n', '<space>ot', ':<c-u>ToggleTerm direction=tab<cr>', { desc = 'Open $TERM in a new tab' })

-- Custom terminals
local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new {
  cmd = 'lazygit',
  direction = 'float',
  close_on_exit = true,
  float_opts = {
    border = 'single',
    winblend = 5,
  },
}

local python = Terminal:new {
  cmd = 'python3',
  direction = 'horizontal',
  close_on_exit = true,
  on_open = function(term)
    vim.notify('Run python3', vim.log.levels.INFO)
  end,
}

local toggle_lazygit = function()
  lazygit:toggle()
end

local toggle_python = function()
  python:toggle()
end

map('n', '<space>rg', toggle_lazygit, { desc = 'Run lazygit in a floating terminal' })
map('n', '<space>rp', toggle_python, { desc = 'Run python3 in a terminal' })
