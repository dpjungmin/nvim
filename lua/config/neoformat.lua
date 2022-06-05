--[[ https://github.com/sbdchd/neoformat ]]

local fos = _G.tovim.format_on_save

if fos.c then
  vim.g.neoformat_enabled_c = { 'clangformat' }
end

if fos.cpp then
  vim.g.neoformat_enabled_cpp = { 'clangformat' }
end

if fos.python then
  vim.g.neoformat_enabled_python = { 'black' }
end

if fos.rust then
  vim.g.neoformat_enabled_rust = { 'rustfmt' }
end

vim.g.neoformat_c_clangformat = {
  exe = 'clang-format',
  args = { "--style='{IndentWidth: 8}'" },
}

vim.g.neoformat_cpp_clangformat = {
  exe = 'clang-format',
  args = { "--style='{IndentWidth: 4}'" },
}
