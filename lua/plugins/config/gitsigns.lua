--[[ https://github.com/lewis6991/gitsigns.nvim ]]

require('gitsigns').setup {
  signs = {
    add = {
      hl = 'GitSignsAdd',
      text = '+',
      numhl = 'GitSignsAddNr',
      linehl = 'GitSignsAddLn',
    },
    change = {
      hl = 'GitSignsChange',
      text = '~',
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn',
    },
    delete = {
      hl = 'GitSignsDelete',
      text = '_',
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn',
    },
    topdelete = {
      hl = 'GitSignsDelete',
      text = '‾',
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn',
    },
    changedelete = {
      hl = 'GitSignsChange',
      text = '~',
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn',
    },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 500,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false,
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        return ']c'
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[c', function()
      if vim.wo.diff then
        return '[c'
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return '<Ignore>'
    end, { expr = true })

    map(
      { 'n', 'v' },
      '<leader>gs',
      '<cmd>Gitsigns stage_hunk<cr>',
      { desc = 'Stage the hunk at the cursor position' }
    )
    map(
      { 'n', 'v' },
      '<leader>gr',
      '<cmd>Gitsigns reset_hunk<cr>',
      { desc = 'Reset the lines of the hunk at the cursor position' }
    )

    map('n', '<leader>gS', gs.stage_buffer, { desc = 'Stage all hunks in current buffer' })
    map('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'Undo the last stage_hunk()' })
    map(
      'n',
      '<leader>gR',
      gs.reset_buffer,
      { desc = 'Reset the lines of all hunks in the buffer' }
    )
    map('n', '<space>p', gs.preview_hunk, { desc = 'Preview the hunk at the cursor position' })
    map('n', '<leader>gb', function()
      gs.blame_line { full = true }
    end, { desc = 'Run git blame on the current line' })
    map('n', '<leader>gd', gs.diffthis, { desc = 'Perform a vimdiff on the given file' })

    map(
      'n',
      '<space>tgb',
      gs.toggle_current_line_blame,
      { desc = 'Toggle current-line git blame' }
    )
    map('n', '<space>tgd', gs.toggle_deleted, { desc = 'Toggle git deleted' })
    map('n', '<space>tgs', gs.toggle_signs, { desc = 'Toggle git signs' })

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<c-u>Gitsigns select_hunk<cr>')
  end,
}
