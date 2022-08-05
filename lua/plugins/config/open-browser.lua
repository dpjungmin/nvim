--[[ https://github.com/tyru/open-browser.vim ]]

vim.cmd [[
  let g:netrw_nogx = 1 " disable netrw's gx mapping.

  nmap gx <Plug>(openbrowser-smart-search)
  vmap gx <Plug>(openbrowser-smart-search)
]]
