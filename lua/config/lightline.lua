--[[ https://github.com/itchyny/lightline.vim ]]

vim.cmd [[
  let g:lightline = {
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'readonly', 'filename', 'modified' ] ],
        \   'right': [ [ 'lineinfo' ],
        \              [ 'percent' ],
        \              [ 'filetype' ] ],
        \ },
        \ 'component_function': {
        \   'filename': 'LightlineFilename'
        \ },
        \ }

  function! LightlineFilename()
    return expand('%:t') !=# '' ? @% : '[No Name]'
  endfunction
]]

