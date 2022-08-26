-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua

local telescope = require 'telescope'
local actions = require 'telescope.actions'

return telescope.setup {
  defaults = {
    winblend = 0,
    prompt_prefix = ' ',
    prompt_title = '',
    preview_title = '',
    selection_caret = '  ',
    results_title = '',
    initial_mode = 'insert',
    border = true,
    multi_icon = '',
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
        preview = {
          ' ',
          '│',
          '─',
          '│',
          ' ',
          '│',
          '┘',
          '─',
        },
        prompt = {
          '─',
          '│',
          '─',
          '│',
          '┌',
          '┐',
          '┘',
          '└',
        },
        results = {
          '─',
          ' ',
          '─',
          '│',
          '┌',
          '┐',
          '─',
          '└',
        },
      },
      layout_config = { prompt_position = 'top', height = 0.4, mirror = false },
      layout_strategy = 'bottom_pane',
      prompt_prefix = '[files] ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
      preview = false,
    },
    grep_string = {
      border = true,
      borderchars = {
        preview = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
        prompt = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
        results = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
      },
      layout_config = {
        anchor = 'CENTER',
        prompt_position = 'top',
        mirror = true,
        width = 0.6,
        height = 0.6,
      },
      layout_strategy = 'vertical',
      prompt_prefix = ' ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
    },
    live_grep = {
      border = true,
      borderchars = {
        preview = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
        prompt = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
        results = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
      },
      layout_config = {
        anchor = 'CENTER',
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
        preview = {
          ' ',
          '│',
          '─',
          '│',
          ' ',
          '│',
          '┘',
          '─',
        },
        prompt = {
          '─',
          '│',
          '─',
          '│',
          '┌',
          '┐',
          '┘',
          '└',
        },
        results = {
          '─',
          ' ',
          '─',
          '│',
          '┌',
          '┐',
          '─',
          '└',
        },
      },
      layout_config = { prompt_position = 'top', height = 0.4, mirror = false },
      layout_strategy = 'bottom_pane',
      prompt_prefix = '[buffers] ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
    },
    oldfiles = {
      border = true,
      borderchars = {
        preview = {
          ' ',
          '│',
          '─',
          '│',
          ' ',
          '│',
          '┘',
          '─',
        },
        prompt = {
          '─',
          '│',
          '─',
          '│',
          '┌',
          '┐',
          '┘',
          '└',
        },
        results = {
          '─',
          ' ',
          '─',
          '│',
          '┌',
          '┐',
          '─',
          '└',
        },
      },
      layout_config = { prompt_position = 'top', height = 0.4, mirror = false },
      layout_strategy = 'bottom_pane',
      prompt_prefix = '[~files] ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
    },
    man_pages = {
      border = true,
      borderchars = {
        preview = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
        prompt = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
        results = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
      },
      layout_config = {
        anchor = 'CENTER',
        prompt_position = 'top',
        mirror = true,
        width = 0.6,
        height = 0.6,
      },
      layout_strategy = 'vertical',
      prompt_prefix = '[man pages] ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
    },
    help_tags = {
      border = true,
      borderchars = {
        preview = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
        prompt = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
        results = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
      },
      layout_config = { anchor = 'CENTER', prompt_position = 'top', mirror = true, width = 0.6 },
      layout_strategy = 'vertical',
      prompt_prefix = '[help tags] ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
    },
    highlights = {
      border = true,
      borderchars = {
        preview = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
        prompt = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
        results = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
      },
      layout_config = { anchor = 'CENTER', prompt_position = 'top', mirror = true, width = 0.6 },
      layout_strategy = 'vertical',
      prompt_prefix = '[highlights] ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
    },
    lsp_references = {
      border = true,
      borderchars = {
        preview = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
        prompt = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
        results = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
      },
      layout_config = { prompt_position = 'top', height = 0.4 },
      layout_strategy = 'cursor',
      prompt_prefix = '(refs) ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
    },
    diagnostics = {
      border = true,
      borderchars = {
        preview = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
        prompt = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
        results = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
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
        preview = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
        prompt = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
        results = {
          '\226\148\128',
          '\226\148\130',
          '\226\148\128',
          '\226\148\130',
          '\226\148\140',
          '\226\148\144',
          '\226\148\152',
          '\226\148\148',
        },
      },
      layout_config = { prompt_position = 'top', height = 0.4 },
      layout_strategy = 'cursor',
      prompt_prefix = '(impls) ',
      prompt_title = '',
      preview_title = '',
      sorting_strategy = 'ascending',
    },
  },
  extensions = {},
}
