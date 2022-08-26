-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

return {
  bashls = {
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'sh' },
    single_file_support = true,
  },
  vimls = {
    cmd = { 'vim-language-server', '--stdio' },
    filetypes = { 'vim' },
    init_options = {
      diagnostic = { enable = true },
      indexes = {
        count = 3,
        gap = 100,
        projectRootPatterns = { 'runtime', 'nvim', '.git', 'autoload', 'plugin' },
        runtimepath = true,
      },
      isNeovim = true,
      iskeyword = '@,48-57,_,192-255,-#',
      runtimepath = '',
      suggest = { fromRuntimepath = true, fromVimruntime = true },
      vimruntime = '',
    },
    single_file_support = true,
    flags = { debounce_text_changes = 500 },
  },
  sumneko_lua = {
    filetypes = { 'lua' },
    log_level = 2,
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        diagnostics = { globals = { 'vim' } },
        workspace = { library = vim.api.nvim_get_runtime_file('', true) },
        telemetry = { enable = false },
      },
    },
    single_file_support = true,
  },
  pyright = {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = 'workspace',
          useLibraryCodeForTypes = true,
        },
      },
    },
  },
  cmake = {
    cmd = { 'cmake-language-server' },
    filetypes = { 'cmake' },
    init_options = { buildDirectory = 'build' },
  },
  tsserver = {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
    },
    init_options = { 'hostInfo', 'neovim' },
    root_dir = (require 'lspconfig.util').root_pattern(
      'package.json',
      'tsconfig.json',
      'jsconfig.json',
      '.git'
    ),
  },
  clangd = function()
    require 'lang.clang'
  end,
  rust_analyzer = function()
    require 'lang.rust'
  end,
}
