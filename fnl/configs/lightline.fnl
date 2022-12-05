; https://github.com/itchyny/lightline.vim

(fn _G.get_active_lsp_client_names []
  (let [client (vim.lsp.get_active_clients)]
    (var name :NO-LSP)
    (each [i c (ipairs client)]
      (if (> i 0) (set name "") (set name (.. name ", ")))
      (set name (.. name c.name)))
    name))

(vim.cmd "  let g:lightline = {
        \\ 'colorscheme': 'one',
        \\ 'active': {
        \\   'left': [ [ 'mode', 'paste' ],
        \\             [ 'gitbranch' ],
        \\             [ 'readonly', 'filename', 'modified', 'method' ],
        \\           ],
        \\   'right': [ [ 'lineinfo' ],
        \\              [ 'percent' ],
        \\              [ 'filetype' ],
        \\              [ 'lsp_client' ]
        \\            ],
        \\ },
        \\ 'component_function': {
        \\   'gitbranch': 'FugitiveHead',
        \\   'filename': 'LightlineFilename',
        \\   'method': 'NearestMethodOrFunction',
        \\   'lsp_client': 'GetActiveLspClients',
        \\ },
        \\ }

  function! LightlineFilename()
    return expand('%:t') !=# '' ? @% : '[No Name]'
  endfunction

  function! GetActiveLspClients()
    return v:lua.get_active_lsp_client_names()
  endfunction
")
