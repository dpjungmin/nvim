--[[ https://github.com/Pocco81/AutoSave.nvim ]]

require('autosave').setup {
  enabled = _G.tovim.autosave,
  execution_message = 'Auto-saved at ' .. vim.fn.strftime('%H:%M:%S'),
  events = { 'InsertLeave', 'TextChanged' },
  conditions = {
    exists = true,
    filename_is_not = { 'plugins.lua' },
    filetype_is_not = {},
    modifiable = true,
  },
  write_all_buffers = false,
  on_off_commands = true,
  clean_command_line_interval = 1000,
  debounce_delay = 135,
}

local map = require('lib.utils').map

map('n', '<space>ta', require('lib.plugins').autosave.toggle, { desc = 'Toggle auto-save' })
