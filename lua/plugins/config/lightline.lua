--[[ https://github.com/itchyny/lightline.vim ]]

function _G.get_active_lsp_client_names()
  local client = vim.lsp.get_active_clients()
  local name = 'NO-LSP'

  for i, c in ipairs(client) do
    if i > 0 then
      name = ''
    else
      name = name .. ', '
    end

    name = name .. c.name
  end

  return name
end

vim.cmd [[
  let g:lightline = {
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch' ],
        \             [ 'readonly', 'filename', 'modified', 'method' ],
        \           ],
        \   'right': [ [ 'lineinfo' ],
        \              [ 'percent' ],
        \              [ 'filetype' ],
        \              [ 'lsp_client' ]
        \            ],
        \ },
        \ 'component_function': {
        \   'gitbranch': 'FugitiveHead',
        \   'filename': 'LightlineFilename',
        \   'method': 'NearestMethodOrFunction',
        \   'lsp_client': 'GetActiveLspClients',
        \ },
        \ }

  function! LightlineFilename()
    return expand('%:t') !=# '' ? @% : '[No Name]'
  endfunction

  function! GetActiveLspClients()
    return v:lua.get_active_lsp_client_names()
  endfunction
]]
