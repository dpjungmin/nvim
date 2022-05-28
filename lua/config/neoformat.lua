--[[ https://github.com/sbdchd/neoformat ]]

vim.g.neoformat_enabled_c = { 'clangformat' }
vim.g.neoformat_enabled_cpp = { 'clangformat' }
vim.g.neoformat_enabled_rust = { 'rustfmt' }
vim.g.neoformat_enabled_python = { 'black' }

vim.g.neoformat_c_clangformat = {
  exe = 'clang-format',
  args = { "--style='{IndentWidth: 8}'" },
}

vim.g.neoformat_cpp_clangformat = {
  exe = 'clang-format',
  args = { "--style='{IndentWidth: 4}'" },
}
