-- https://github.com/mhartington/formatter.nvim

local util = require 'formatter.util'

require('formatter').setup {
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = {
      function()
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
          args = { "--style='{BasedOnStyle: LLVM}'" },
          stdin = true,
        }
      end,
    },
    cpp = {
      function()
        return {
          exe = 'clang-format',
          args = { "--style='{BasedOnStyle: LLVM}'" },
          stdin = true,
        }
      end,
    },
    rust = {
      function()
        return {
          exe = 'rustfmt',
          args = { '--edition=2022' },
          stdin = true,
        }
      end,
    },
    python = { (require 'formatter.filetypes.python').black },
    markdown = { (require 'formatter.filetypes.markdown').prettierd },
    javascript = { (require 'formatter.filetypes.javascript').prettierd },
    javascriptreact = { (require 'formatter.filetypes.javascriptreact').prettierd },
    typescript = { (require 'formatter.filetypes.typescript').prettierd },
    typescriptreact = { (require 'formatter.filetypes.typescriptreact').prettierd },
    css = { (require 'formatter.filetypes.css').prettierd },
    html = { (require 'formatter.filetypes.html').prettierd },
    ['*'] = { (require 'formatter.filetypes.any').remove_trailing_whitespace },
  },
}
