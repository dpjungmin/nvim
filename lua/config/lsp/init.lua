--[[

- https://github.com/neovim/nvim-lspconfig
- https://github.com/williamboman/nvim-lsp-installer

]]

-- Auto-install language servers
require('nvim-lsp-installer').setup {
  ensure_installed = {
    'bashls',
    'vimls',
    'sumneko_lua',
    'pylsp',
    'clangd',
    'cmake',
    'rust_analyzer',
  },
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = '✓',
      server_pending = '➜',
      server_uninstalled = '✗',
    },
  },
}

-- Load LSP global configurations
require 'config.lsp.config'

-- Custom `on_attach` function
local on_attach = function(client, bufnr)
  -- Enable completion triggered by `<c-x><c-o>`
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }

    if opts then
      options = vim.tbl_extend('force', options, opts)
    end

    vim.keymap.set(mode, lhs, rhs, options)
  end

  map(
    'n',
    '[d',
    vim.diagnostic.goto_prev,
    { desc = 'Move to the previous diagnostic in the current buffer' }
  )
  map(
    'n',
    ']d',
    vim.diagnostic.goto_next,
    { desc = 'Move to the next diagnostic in the current buffer' }
  )

  map(
    'n',
    '<space>cd',
    vim.lsp.buf.definition,
    { desc = 'Jumps to the definition of the symbol under the cursor' }
  )
  map(
    'n',
    '<space>cD',
    vim.lsp.buf.declaration,
    { desc = 'Jumps to the declaration of the symbol under the cursor' }
  )
  map(
    'n',
    '<space>ca',
    vim.lsp.buf.code_action,
    { desc = 'Selects a code action available at the current cursor position' }
  )
  map(
    'n',
    '<space>ctd',
    vim.lsp.buf.type_definition,
    { desc = 'Jumps to the definition of the type of the symbol under the cursor' }
  )
  map(
    'n',
    '<space>crn',
    vim.lsp.buf.rename,
    { desc = 'Renames all references of the symbol under the cursor' }
  )
  map(
    'n',
    '<space>clr',
    vim.lsp.buf.references,
    { desc = 'Lists all the references to the symbol under the cursor in the quickfix window' }
  )

  map(
    'n',
    'K',
    vim.lsp.buf.hover,
    { desc = 'Displays hover information about the symbol under the cursor' }
  )
  map(
    'n',
    '<m-k>',
    vim.lsp.buf.signature_help,
    { desc = 'Displays signature information about the symbol under the cursor' }
  )
  map('n', '<space>q', function()
    vim.diagnostic.setqflist { open = true }
  end, { desc = 'Add all diagnostics to the quickfix list' })
  map('n', '<space>e', function()
    vim.diagnostic.open_float()
  end, { desc = 'Show diagnostics in a floating window' })

  map(
    'n',
    '<space>wa',
    vim.lsp.buf.add_workspace_folder,
    { desc = 'Add the folder at path to the workspace folders' }
  )
  map(
    'n',
    '<space>wr',
    vim.lsp.buf.remove_workspace_folder,
    { desc = 'Remove the folder at path from the workspace folders' }
  )
  map('n', '<space>wl', function()
    vim.notify(
      vim.inspect(vim.lsp.buf.list_workspace_folders()),
      vim.log.levels.INFO,
      { render = 'default', title = 'Workspace folders' }
    )
  end, { desc = 'List workspace folders' })

  if client.server_capabilities.document_formatting then
    map(
      'n',
      '<space>cf',
      vim.lsp.buf.formatting_sync,
      { desc = 'Formats the current buffer synchronously' }
    )
  end

  if client.server_capabilities.document_range_formatting then
    map('x', '<space>cf', vim.lsp.buf.range_formatting, { desc = 'Formats a given range' })
  end

  if client.server_capabilities.document_highlight then
    vim.cmd [[
      hi! link LspReferenceRead Visual
      hi! link LspReferenceText Visual
      hi! link LspReferenceWrite Visual

      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- Add additional capabilities supported by `nvim_cmp`
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Enable language servers
local lspconfig = require 'lspconfig'

for server, opts in pairs(require 'config.lsp.servers') do
  local options = { on_attach = on_attach, flags = lsp_flags, capabilities = capabilities }

  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  lspconfig[server].setup(options)
end

-- Load language specific plugins
require 'config.lsp.clang'
require 'config.lsp.rust'