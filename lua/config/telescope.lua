--[[ https://github.com/nvim-telescope/telescope.nvim ]]

require('telescope').setup {
  defaults = {
    winblend = 5,
    prompt_prefix = ': ',
    prompt_title = '',
    selection_caret = '> ',
    results_title = '',
    border = true,
    preview = false,
  },
  pickers = {
    find_files = {
      theme = 'ivy',
      prompt_prefix = 'Search files: ',
      prompt_title = '',
    },
    git_files = {
      theme = 'ivy',
      preview = true,
    },
    grep_string = {
      theme = 'dropdown',
      prompt_prefix = 'Search string in current buffer: ',
      preview = true,
      preview_title = '',
    },
    live_grep = {
      preview = true,
      border = true,
      preview_title = '',
    },
    buffers = {
      theme = 'ivy',
      preview = true,
      prompt_prefix = 'Search buffers: ',
      prompt_title = '',
      preview_title = '',
    },
    help_tags = {
      theme = 'ivy',
      preview = true,
      prompt_prefix = 'Search help tags: ',
      prompt_title = '',
      preview_title = '',
    },
    highlights = {
      theme = 'ivy',
      preview = true,
      prompt_prefix = 'Search highlights: ',
      prompt_title = '',
      preview_title = '',
    },
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

local map = require('lib.utils').map

map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'List files in current directory' })
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Search for a string in your current directory' })
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'List open buffers' })
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'List available help tags' })
map('n', '<leader>fc', '<cmd>Telescope highlights<cr>', { desc = 'List available highlights' })
map('n', '<leader>fn', require('lib.plugins').telescope.find_nvim_configs, { desc = 'List Neovim config files' })
map('n', '<leader>fm', require('lib.plugins').telescope.reloader, { desc = 'Search and reload modules' })
