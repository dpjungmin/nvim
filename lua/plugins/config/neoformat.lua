--[[

https://github.com/sbdchd/neoformat
https://clang.llvm.org/docs/ClangFormatStyleOptions.html#clang-format-style-options

--]]

local g = vim.g
local fos = {
  c = false,
  cpp = true,
  python = false,
  rust = true,
}

g.neoformat_enabled_c = {}
g.neoformat_enabled_cpp = {}
g.neoformat_enabled_python = {}
g.neoformat_enabled_rust = {}

if fos.c then
  g.neoformat_enabled_c = { 'clangformat' }
end

if fos.cpp then
  g.neoformat_enabled_cpp = { 'clangformat' }
end

if fos.python then
  g.neoformat_enabled_python = { 'black' }
end

if fos.rust then
  g.neoformat_enabled_rust = { 'rustfmt' }
end

g.neoformat_c_clangformat = {
  exe = 'clang-format',
  args = { "--style='{BasedOnStyle: Mozilla}'" },
}

g.neoformat_cpp_clangformat = {
  exe = 'clang-format',
  args = { "--style='{BasedOnStyle: Mozilla}'" },
}
