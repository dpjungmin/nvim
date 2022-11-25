--[[ https://github.com/akinsho/toggleterm.nvim ]]

require('toggleterm').setup {
  shell = os.getenv 'SHELL' or 'sh',
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
