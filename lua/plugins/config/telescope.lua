--[[ https://github.com/nvim-telescope/telescope.nvim ]]

local actions = require 'telescope.actions'

require('telescope').setup {
  defaults = {
    winblend = 0,
    prompt_prefix = ': ',
    prompt_title = '',
    preview_title = '',
    selection_caret = '  ',
    results_title = '',
    border = true,
    preview = false,
    multi_icon = '',
    -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<tab>'] = actions.move_selection_next,
        ['<s-tab>'] = actions.move_selection_previous,
        ['<c-j>'] = actions.move_selection_next,
        ['<c-k>'] = actions.move_selection_previous,
      },
    },
    layout_config = {
      bottom_pane = {
        height = 25,
        preview_cutoff = 120,
        prompt_position = 'top',
      },
      center = {
        height = 0.4,
        preview_cutoff = 40,
        prompt_position = 'top',
        width = 0.5,
      },
      cursor = {
        height = 0.9,
        preview_cutoff = 40,
        width = 0.8,
      },
      horizontal = {
        height = 0.9,
        preview_cutoff = 120,
        prompt_position = 'bottom',
        width = 0.8,
      },
      vertical = {
        height = 0.9,
        preview_cutoff = 40,
        prompt_position = 'bottom',
        width = 0.8,
      },
    },
  },
  pickers = {
    find_files = {
      theme = 'ivy',
      prompt_prefix = '[find files]: ',
      prompt_title = '',
      preview_title = '',
    },
    grep_string = {
      theme = 'cursor',
      prompt_prefix = ':',
      preview_title = '',
    },
    live_grep = {
      theme = 'dropdown',
      prompt_title = '',
      preview_title = '',
    },
    buffers = {
      theme = 'ivy',
      prompt_prefix = '[buffers]: ',
      prompt_title = '',
      preview_title = '',
    },
    oldfiles = {
      theme = 'ivy',
      prompt_prefix = '[recent files]: ',
      prompt_title = '',
      preview_title = '',
    },
    man_pages = {
      theme = 'ivy',
      prompt_prefix = '[man pages]: ',
      prompt_title = '',
      preview_title = '',
    },
    help_tags = {
      theme = 'ivy',
      prompt_prefix = '[help tags]: ',
      prompt_title = '',
      preview_title = '',
    },
    highlights = {
      theme = 'ivy',
      prompt_prefix = '[highlights]: ',
      prompt_title = '',
      preview_title = '',
    },
    lsp_references = {
      theme = 'cursor',
      prompt_prefix = ':',
      prompt_title = '[references]',
      preview_title = '',
    },
    diagnostics = {
      theme = 'ivy',
      prompt_prefix = '[diagnostics]: ',
      prompt_title = '',
      preview_title = '',
    },
    lsp_implementations = {
      theme = 'cursor',
      prompt_prefix = ':',
      prompt_title = '[implementations]',
      preview_title = '',
    },
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}

local map = require('lib.utils').map

map('n', '<space>.', '<cmd>Telescope find_files<cr>', { desc = 'List files in current directory' })
map(
  'n',
  '<space>g',
  '<cmd>Telescope grep_string<cr>',
  { desc = 'Searches for the string under your cursor in your current working directory' }
)
map(
  'n',
  '<space>G',
  '<cmd>Telescope live_grep<cr>',
  { desc = 'Search for a string in your current directory' }
)

map('n', '<space>,', '<cmd>Telescope buffers<cr>', { desc = 'List open buffers' })
map('n', '<space>fr', '<cmd>Telescope oldfiles<cr>', { desc = 'Lists most recently opened files' })
map('n', '<space>fm', '<cmd>Telescope man_pages<cr>', { desc = 'Lists man page entries' })
map('n', '<space>fh', '<cmd>Telescope help_tags<cr>', { desc = 'List available help tags' })
map('n', '<space>fH', '<cmd>Telescope highlights<cr>', { desc = 'List available highlights' })

map(
  'n',
  '<space>fcr',
  '<cmd>Telescope lsp_references<cr>',
  { desc = 'Lists LSP references for the work under the cursor' }
)
map(
  'n',
  '<space>fd',
  '<cmd>Telescope diagnostics<cr>',
  { desc = 'Lists diagnostics for all open buffers' }
)
map(
  'n',
  '<space>fci',
  '<cmd>Telescope lsp_implementations<cr>',
  { desc = 'Lists implementations of the work under the cursor' }
)

map(
  'n',
  '<space>fn',
  require('lib.plugins').telescope.find_nvim_configs,
  { desc = 'List Neovim config files' }
)
