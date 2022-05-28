local sign = {
  text = {
    { name = 'DiagnosticSignError', text = 'E' },
    { name = 'DiagnosticSignWarn', text = 'W' },
    { name = 'DiagnosticSignInformation', text = 'I' },
    { name = 'DiagnosticSignHint', text = 'H' },
  },
  emoji = {
    { name = 'DiagnosticSignError', text = '✗' },
    { name = 'DiagnosticSignWarn', text = '!' },
    { name = 'DiagnosticSignInformation', text = '' },
    { name = 'DiagnosticSignHint', text = '' },
  },
}

for _, s in pairs(sign['text']) do
  vim.fn.sign_define(s.name, { text = s.text, texthl = s.name })
end

vim.diagnostic.config {
  underline = false,
  virtual_text = {
    spacing = 0,
    prefix = '',
  },
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
      local severity = diagnostic.severity
      local message = diagnostic.message

      if severity == vim.diagnostic.severity.ERROR then
        message = '[E] ' .. message
      elseif severity == vim.diagnostic.severity.WARN then
        message = '[W] ' .. message
      elseif severity == vim.diagnostic.severity.INFO then
        message = '[I] ' .. message
      elseif severity == vim.diagnostic.severity.HINT then
        message = '[H] ' .. message
      end

      return message
    end,
  },
  update_in_insert = false,
  severity_sort = true,
}

-- Custom LSP handler settings (see `:lua vim.pretty_print(vim.lsp.handlers)`)
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
  focusable = false,
  border = 'single',
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  focusable = false,
  border = 'single',
})

local map = require('lib.utils').map

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

map('n', '<space>q', function()
  vim.diagnostic.setqflist { open = true }
end, { desc = 'Add all diagnostics to the quickfix list' })
map('n', '<space>e', function()
  vim.diagnostic.open_float()
end, { desc = 'Show diagnostics in a floating window' })

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
