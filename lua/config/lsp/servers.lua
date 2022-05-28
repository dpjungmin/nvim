-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  bashls = {},
  vimls = {
    flags = {
      debounce_text_changes = 500,
    },
  },
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
  pylsp = {
    settings = {
      pylsp = {
        plugins = {
          pylint = { enabled = true, executable = 'pylint' },
          pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
          jedi_completion = { fuzzy = true },
          pyls_isort = { enabled = true },
          pylsp_mypy = { enabled = true },
        },
      },
    },
    flags = {
      debounce_text_changes = 200,
    },
  },
}

return servers
