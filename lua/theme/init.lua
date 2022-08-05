local theme = _G.config.theme or 'dark'
local notify = require('lib.utils').notify
local highlight = require('lib.utils').highlight
local ok, colorscheme = pcall(require, 'theme.themes.' .. theme)

if not ok then
  notify('Cannot find theme ' .. theme)
  return
end

if theme == 'light' then
  vim.opt.background = 'light'
end

if vim.g.colors_name then
  vim.cmd 'hi clear'
end

vim.g.colors_name = 'dpjungmin'

vim.cmd [[
  set t_Co=256
  let base16colorspace=256
  syntax enable
  set termguicolors
]]

for name, props in pairs(colorscheme) do
  highlight(name, props)
end
