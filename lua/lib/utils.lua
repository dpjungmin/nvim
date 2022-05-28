local M = {}

M.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

M.toggle_cursorcolumn = function()
  if vim.opt.cursorcolumn:get() then
    vim.opt.cursorcolumn = false
    vim.notify('cursorcolumn OFF', vim.log.levels.ERROR, { timeout = 500 })
  else
    vim.opt.cursorcolumn = true
    vim.notify('cursorcolumn ON', vim.log.levels.INFO, { timeout = 500 })
  end
end

M.make_custom_highlights = function()
  vim.cmd [[
    " Only highlight the line number
    highlight clear Cursorline

    " For yank highlight
    highlight YankColor ctermfg=59 ctermbg=41 guifg=#34495E guibg=#2ECC71

    " For cursor colors
    highlight Cursor cterm=bold gui=bold guibg=#00c918 guifg=black
    highlight Cursor2 guifg=red guibg=red

    " For floating windows highlight
    highlight NormalFloat guifg=None guibg=None
    highlight FloatBorder guifg=LightGreen guibg=NONE

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
