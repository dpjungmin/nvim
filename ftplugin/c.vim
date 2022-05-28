if (&ft == 'cpp')
  finish
endif

set tabstop=8
set softtabstop=8
set shiftwidth=8
set expandtab

nnoremap <silent> <buffer> <f9> :call <sid>compile_and_run_c()<cr>

function! s:compile_and_run_c() abort
  let src_path = expand('%:p:~')
  let src_noext = expand('%:p:~:r')
  let flag = '-Wall -g -O1'

  if executable('clang')
    let prog = 'clang'
  elseif executable('gcc')
    let prog = 'gcc'
  else
    echoerr 'No C compiler found on the system!'
  endif

  setlocal splitbelow
  new
  execute 'resize 20'
  execute printf('term %s %s %s -o %s && %s', prog, flag, src_path, src_noext, src_noext)
  startinsert
endfunction
