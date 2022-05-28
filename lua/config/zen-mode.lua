--[[ https://github.com/folke/zen-mode.nvim ]]

require('zen-mode').setup {
  window = {
    backdrop = 0.85,
    width = 0.8,
    height = 1.0,
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false,
      showcmd = false,
    },
    twilight = { enabled = true },
    gitsigns = { enabled = false },
    tmux = { enabled = false },
  },
  on_open = function(win)
    vim.notify('zen mode ON', vim.log.levels.INFO, { timeout = 500 })
  end,
  on_close = function()
    vim.notify('zen mode OFF', vim.log.levels.ERROR, { timeout = 500 })
  end,
}

local map = require('lib.utils').map

map('n', '<space>tz', '<cmd>ZenMode<cr>', { desc = 'Toggle zen-mode' })
