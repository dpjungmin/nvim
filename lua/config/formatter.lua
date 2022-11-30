-- [[ https://github.com/mhartington/formatter.nvim ]]

-- Utilities for creating configurations
local util = require 'formatter.util'

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require('formatter').setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      function()
        -- Supports conditional formatting
        -- if util.get_current_buffer_file_name() == 'special.lua' then
        --   return nil
        -- end

        -- Full specification of configurations is down below and in Vim help
        -- files
        return {
          exe = 'stylua',
          args = {
            '--search-parent-directories',
            '--stdin-filepath',
            util.escape_path(util.get_current_buffer_file_path()),
            '--',
            '-',
          },
          stdin = true,
        }
      end,
    },

    c = {
      function()
        return {
          exe = 'clang-format',
          args = {
            "--style='{BasedOnStyle: LLVM}'",
          },
          stdin = true,
        }
      end,
    },

    cpp = {
      function()
        return {
          exe = 'clang-format',
          args = {
            "--style='{BasedOnStyle: LLVM}'",
          },
          stdin = true,
        }
      end,
    },

    rust = {
      function()
        return {
          exe = 'rustfmt',
          stdin = true,
        }
      end,
    },

    python = {
      require('formatter.filetypes.python').black,
    },

    markdown = {
      require('formatter.filetypes.markdown').prettierd,
    },

    javascript = {
      require('formatter.filetypes.javascript').prettierd,
    },

    javascriptreact = {
      require('formatter.filetypes.javascriptreact').prettierd,
    },

    typescript = {
      require('formatter.filetypes.typescript').prettierd,
    },

    typescriptreact = {
      require('formatter.filetypes.typescriptreact').prettierd,
    },

    css = {
      require('formatter.filetypes.css').prettierd,
    },

    html = {
      require('formatter.filetypes.html').prettierd,
    },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ['*'] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require('formatter.filetypes.any').remove_trailing_whitespace,
    },
  },
}
