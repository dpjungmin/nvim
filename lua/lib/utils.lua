local M = {}

function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.keymap.set(mode, lhs, rhs, options)
end

function M.notify(msg, log_level, opts)
  local level = log_level or 0 and vim.log.levels.ERROR
  local options = {}

  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  if vim.in_fast_event() then
    vim.schedule(function()
      vim.notify(msg, level, options)
    end)
  else
    vim.notify(msg, level, options)
  end
end

function M.toggle_cursorhl()
  local opt = vim.opt

  if opt.cursorline:get() then
    opt.cursorline = false
    opt.cursorcolumn = false
    M.notify('Disabled cursor-highlight', vim.log.levels.INFO)
  else
    opt.cursorline = true
    opt.cursorcolumn = true
    M.notify('Enabled cursor-highlight', vim.log.levels.INFO)
  end
end

function M.resume_last_cursor_position()
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

function M.highlight(name, props)
  if props.link then
    vim.cmd('highlight! link ' .. name .. ' ' .. props.link)
    return
  end

  local val = {}

  if props.fg then
    val.fg = props.fg
  end

  if props.bg then
    val.bg = props.bg
  end

  if props.sp then
    val.sp = props.sp
  end

  if props.style and not (props.style == 'NONE') then
    if type(props.style) == 'string' then
      val[props.style] = true
    end

    if type(props.style) == 'table' then
      for _, style in ipairs(props.style) do
        val[style] = true
      end
    end
  end

  vim.api.nvim_set_hl(0, name, val)
end

return M
