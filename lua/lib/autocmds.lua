-- http://vimdoc.sourceforge.net/htmldoc/autocmd.html

local M = {}

M.autocmds =  {
  _customize_colors = {
    { 'ColorScheme', '*', "lua require('lib.utils').make_custom_highlights()" },
  },
  _highlight_yank = {
    { 'TextYankPost', '*', 'silent!', "lua vim.highlight.on_yank { higroup = 'YankColor', timeout = 300, on_visual = true }" },
  },
  _term = {
    { 'TermOpen', '*', 'setlocal norelativenumber nonumber' },
    { 'TermOpen', '*', 'startinsert' },
  },
  _dynamic_smartcase = {
    { 'CmdLineEnter', ':', 'set nosmartcase' },
    { 'CmdLineLeave', ':', 'set smartcase' },
  },
  _accurate_syntax_highlighting = {
    { 'BufEnter', '*', ':syntax sync fromstart' },
  },
  _auto_reload = {
    { 'FileChangedShellPost', '*', "lua vim.notify('File changed on disk. Buffer reloaded!', vim.log.levels.WARN)" },
    { 'FocusGained,CursorHold', '*', "if getcmdwintype() == '' | checktime | endif" },
  },
  _toggle_number = {
    { 'BufEnter,FocusGained,InsertLeave,WinEnter', '*', 'if &nu | set rnu | endif' },
    { 'BufLeave,FocusLost,InsertEnter,WinLeave', '*', 'if &nu | set nornu | endif' },
  },
  _resume_cursor_position = {
    { 'BufReadPost', '*', "lua require('lib.utils').resume_last_cursor_position()" },
  },
  _indent_blankline = {
    { 'InsertEnter', '*', 'IndentBlanklineDisable' },
    { 'InsertLeave', '*', "lua require('lib.plugins').indent_blankline.activate()" },
  },
  _format_on_save = {
    { 'BufWritePre', '*', 'try | undojoin | Neoformat | catch /^Vim\\%((\\a\\+)\\)\\=:E790/ | finally | silent Neoformat | endtry' },
  },
  _auto_compile_packer = {
    { 'BufWritePost', '*/nvim/lua/plugins.lua', 'source <afile> | PackerCompile' },
  },
  _puppet = {
    { 'BufNewFile,BufRead', '*.pp', 'setfiletype puppet' },
    { 'BufNewFile,BufRead', '*.pp', 'set shiftwidth=2 softtabstop=2 filetype=puppet' },
  },
}

M.load = function()
  for gn, cmds in pairs(M.autocmds) do
    vim.cmd('augroup ' .. gn)
    vim.cmd 'autocmd!'

    for _, cmd in ipairs(cmds) do
      cmd = table.concat(vim.tbl_flatten { 'autocmd', cmd }, ' ')
      vim.cmd(cmd)
    end

    vim.cmd 'augroup END'
  end
end

return M
