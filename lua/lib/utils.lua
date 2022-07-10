local M = {}

M.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

M.toggle_cursorhl = function()
  if vim.opt.cursorline:get() then
    vim.opt.cursorline = false
    vim.opt.cursorcolumn = false
    vim.notify('cursor highlight OFF', vim.log.levels.ERROR, { timeout = 500 })
  else
    vim.opt.cursorline = true
    vim.opt.cursorcolumn = true
    vim.notify('cursor highlight ON', vim.log.levels.INFO, { timeout = 500 })
  end
end

M.make_custom_highlights = function()
  vim.cmd [[
    " For yank highlight
    highlight YankColor ctermfg=59 ctermbg=41 guifg=#34495E guibg=#2ECC71

    " For cursor colors
    highlight Cursor cterm=bold gui=bold guibg=#00c918 guifg=black
    highlight Cursor2 guifg=red guibg=red

    " For floating windows highlight
    highlight NormalFloat guifg=#d5c4a1 guibg=#3c3836
    highlight FloatBorder guifg=LightGreen guibg=None
    highlight ErrorFloat guibg=None
    highlight WarningFloat guibg=None
    highlight InfoFloat guibg=None
    highlight HintFloat guibg=None

    " For git signs
    highlight GitGutterAdd guibg=None
    highlight GitGutterChange guibg=None
    highlight GitGutterDelete guibg=None

    " Highlight for matching parentheses
    highlight MatchParen cterm=bold,underline gui=bold,underline
  ]]
end

M.resume_last_cursor_position = function()
  vim.cmd [[
    let ok = v:true

    if line("'\"") > 1 && line("'\"") <= line('$') && &ft !~# 'commit'
      let args = v:argv  " command line arguments

      for arg in args
        if match(arg, '\v^\+(\d){1,}$') != -1
          ok = false
          break
        endif
      endfor

      if ok
        execute "normal! g`\"zvzz"
      endif
    endif
  ]]
end

return M
