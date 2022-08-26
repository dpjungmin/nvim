-- https://github.com/williamboman/mason.nvim
(require 'mason').setup {
  ui = {
    icons = {
      server_installed = '✓',
      server_pending = '➜',
      server_uninstalled = '✗',
    },
  },
}

-- https://github.com/williamboman/mason-lspconfig.nvim
require('mason-lspconfig').setup { automatic_installation = false }

-- Define sign names
-- stylua: ignore start
vim.fn.sign_define('DiagnosticSignError', { text = 'E', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = 'W', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInformation', { text = 'I', texthl = 'DiagnosticSignInformation' })
vim.fn.sign_define('DiagnosticSignHint', { text = 'H', texthl = 'DiagnosticSignHint' })
-- stylua: ignore end

--  Configure diagnostic options
vim.diagnostic.config {
  virtual_text = { spacing = 0, prefix = '' },
  signs = true,
  float = {
    wrap = true,
    pad_top = 0,
    pad_bottom = 0,
    focusable = true,
    style = 'minimal',
    border = 'single',
    source = 'always',
    header = '',
    prefix = '',
    format = function(diagnostic)
      local sev = diagnostic.severity
      local msg = diagnostic.message
      if sev == vim.diagnostic.severity.ERROR then
        msg = ('[E] ' .. msg)
      elseif sev == vim.diagnostic.severity.WARN then
        msg = ('[W] ' .. msg)
      elseif sev == vim.diagnostic.severity.INFO then
        msg = ('[I] ' .. msg)
      elseif sev == vim.diagnostic.severity.HINT then
        msg = ('[H] ' .. msg)
      end
      return msg
    end,
  },
  severity_sort = true,
  underline = false,
  update_in_insert = false,
}

-- stylua: ignore start
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'single', focusable = false })
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'single', focusable = false })
-- stylua: ignore end

-- https://github.com/neovim/nvim-lspconfig
local function on_attach(client, bufnr)
  local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
      options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
  end

  -- stylua: ignore start
  map('n', 'K', vim.lsp.buf.hover, { desc = 'Displays hover information about the symbol under the cursor' })
  map('n', '<m-k>', vim.lsp.buf.signature_help, { desc = 'Displays signature information about the symbol under the cursor' })
  map('n', '<space>cd', vim.lsp.buf.definition, { desc = 'Jumps to the definition of the symbol under the cursor' })
  map('n', '<space>cD', vim.lsp.buf.declaration, { desc = 'Jumps to the declaration of the symbol under the cursor' })
  map('n', '<space>ca', vim.lsp.buf.code_action, { desc = 'Selects a code action available at the current cursor position' })
  map('n', '<space>ctd', vim.lsp.buf.type_definition, { desc = 'Jumps to the definition of the type of the symbol under the cursor' })
  map('n', '<space>crn', vim.lsp.buf.rename, { desc = 'Renames all references of the symbol under the cursor' })
  map('n', '<space>clr', vim.lsp.buf.references, { desc = 'Lists all the references to the symbol under the cursor in the quickfix window' })
  map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { desc = 'Add the folder at path to the workspace folders' })
  map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { desc = 'Remove the folder at path from the workspace folders' })
  map('n', '<space>wl', function()
    vim.notify(
      vim.inspect(vim.lsp.buf.list_workspace_folders()),
      vim.log.levels.INFO,
      { render = 'default', title = 'Workspace folders' }
    )
  end, { desc = 'List workspace folders' })
  -- stylua: ignore end
end

local lsp_servers = require 'lang.servers'
local lspconfig = require 'lspconfig'

for server, config in pairs(lsp_servers) do
  local opts = {
    capabilities = (require 'cmp_nvim_lsp').default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    ),
    flags = { debounce_text_changes = 150 },
    on_attach = on_attach,
  }
  if type(config) == 'function' then
    config()
    return
  end
  for k, v in pairs(config) do
    opts[k] = v
  end
  lspconfig[server].setup(opts)
end
