--[[ https://github.com/sbdchd/neoformat ]]

vim.g.neoformat_enabled_c = _G.tovim.formatter.c
vim.g.neoformat_enabled_cpp = _G.tovim.formatter.cpp
vim.g.neoformat_enabled_python = _G.tovim.formatter.python
vim.g.neoformat_enabled_rust = { 'rustfmt' }

vim.g.neoformat_c_clangformat = {
  exe = 'clang-format',
  args = { "--style='{IndentWidth: 8}'" },
}

vim.g.neoformat_cpp_clangformat = {
  exe = 'clang-format',
  args = { "--style='{IndentWidth: 4}'" },
}
