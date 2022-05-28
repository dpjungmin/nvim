set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

nnoremap <silent> <buffer> <f9> :call <sid>compile_and_run_cpp()<cr>

function! s:compile_and_run_cpp() abort
  let src_path = expand('%:p:~')
  let src_noext = expand('%:p:~:r')
  let flag = '-Wall -g -Wextra -std=c++17 -O1'

  if executable('clang++')
    let prog = 'clang++'
  elseif executable('g++')
    let prog = 'g++'
  else
    echoerr 'No C++ compiler found on the system!'
  endif

  setlocal splitbelow
  new
  execute 'resize 20'
  execute printf('term %s %s %s -o %s && %s', prog, flag, src_path, src_noext, src_noext)
  startinsert
endfunction
