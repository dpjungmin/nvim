--[[ https://github.com/nvim-telescope/telescope.nvim ]]

local actions = require 'telescope.actions'

require('telescope').setup {
  defaults = {
    winblend = 0,
    prompt_prefix = ' ',
    prompt_title = '',
    preview_title = '',
    selection_caret = '  ',
    results_title = '',
    initial_mode = 'insert',
    border = true,
    -- preview = false,
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
  },
  pickers = {
    find_files = {
      border = true,
      borderchars = {
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        prompt = { 'ㅡ' },
        results = { 'ㅡ', ' ', 'ㅡ', ' ', ' ', ' ', ' ', ' ' },
      },
      layout_config = {
        prompt_position = 'top',
        mirror = false,
        height = 0.4,
      },
      layout_strategy = 'bottom_pane',
      prompt_prefix = '[files] ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
    },
    grep_string = {
      border = true,
      borderchars = {
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      },
      layout_config = {
        anchor = 'CENTER', -- "", "CENTER", "NW", "N", "NE", "E", "SE", "S", "SW", "W" The anchors
        prompt_position = 'top',
        mirror = true,
        width = 0.6,
        height = 0.6,
      },
      layout_strategy = 'vertical', -- 'center' | 'cursor' | 'vertical' | 'horizontal' | 'bottom_pane'
      prompt_prefix = ' ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
    },
    live_grep = {
      border = true,
      borderchars = {
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      },
      layout_config = {
        anchor = 'CENTER', -- "", "CENTER", "NW", "N", "NE", "E", "SE", "S", "SW", "W" The anchors
        prompt_position = 'top',
        mirror = true,
        width = 0.6,
        height = 0.6,
      },
      layout_strategy = 'vertical',
      prompt_prefix = '(ripgrep) ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
    },
    buffers = {
      border = true,
      borderchars = {
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        prompt = { 'ㅡ' },
        results = { 'ㅡ', ' ', 'ㅡ', ' ', ' ', ' ', ' ', ' ' },
      },
      layout_config = {
        prompt_position = 'top',
        mirror = false,
        height = 0.4,
      },
      layout_strategy = 'bottom_pane',
      prompt_prefix = '[buffers] ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
    },
    oldfiles = {
      border = true,
      borderchars = {
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        prompt = { 'ㅡ' },
        results = { 'ㅡ', ' ', 'ㅡ', ' ', ' ', ' ', ' ', ' ' },
      },
      layout_config = {
        prompt_position = 'top',
        mirror = false,
        height = 0.4,
      },
      layout_strategy = 'bottom_pane',
      prompt_prefix = '[~files] ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
    },
    man_pages = {
      border = true,
      borderchars = {
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      },
      layout_config = {
        anchor = 'CENTER',
        prompt_position = 'top',
        mirror = true,
        width = 0.6,
        height = 0.6,
      },
      layout_strategy = 'vertical',
      prompt_prefix = '[manual pages] ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
    },
    help_tags = {
      border = true,
      borderchars = {
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      },
      layout_config = {
        anchor = 'SE',
        prompt_position = 'top',
        mirror = true,
        width = 0.6,
      },
      layout_strategy = 'vertical',
      prompt_prefix = '[help tags] ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
    },
    highlights = {
      border = true,
      borderchars = {
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      },
      layout_config = {
        anchor = 'SE',
        prompt_position = 'top',
        mirror = true,
        width = 0.6,
      },
      layout_strategy = 'vertical',
      prompt_prefix = '[highlights] ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
    },
    lsp_references = {
      border = true,
      borderchars = {
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      },
      layout_config = {
        prompt_position = 'top',
        height = 0.4,
      },
      layout_strategy = 'cursor',
      prompt_prefix = '(refs) ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
    },
    diagnostics = {
      border = true,
      borderchars = {
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      },
      layout_config = {
        anchor = 'CENTER',
        prompt_position = 'top',
        mirror = true,
        width = 0.6,
        height = 0.6,
      },
      layout_strategy = 'vertical',
      prompt_prefix = '[diagnostics] ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
    },
    lsp_implementations = {
      border = true,
      borderchars = {
        preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        prompt = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        results = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      },
      layout_config = {
        prompt_position = 'top',
        height = 0.4,
      },
      layout_strategy = 'cursor',
      prompt_prefix = '(impls) ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
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
  '<space>K',
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
  '<space>i',
  '<cmd>Telescope lsp_implementations<cr>',
  { desc = 'Lists implementations of the work under the cursor' }
)

map('n', '<space>fn', function()
  require('telescope.builtin').find_files(require('telescope.themes').get_ivy {
    border = true,
    borderchars = {
      preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
      prompt = { 'ㅡ' },
      results = { 'ㅡ', ' ', 'ㅡ', ' ', ' ', ' ', ' ', ' ' },
    },
    layout_config = {
      prompt_position = 'top',
      mirror = false,
      height = 0.4,
    },
    layout_strategy = 'bottom_pane',
    cwd = '~/.config/nvim',
    prompt = '',
    prompt_prefix = '[nvim config files]: ',
    shorten_path = true,
    sorting_strategy = 'ascending',
  })
end, { desc = 'List Neovim config files' })
