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
