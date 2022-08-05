-- http://vimdoc.sourceforge.net/htmldoc/autocmd.html

local M = {}

local autocmds = {
  highlight_yank = {
    {
      'TextYankPost',
      '*',
      'silent!',
      "lua vim.highlight.on_yank { higroup = 'YankColor', timeout = 300, on_visual = true }",
    },
  },
  open_terminal = {
    { 'TermOpen', '*', 'setlocal norelativenumber nonumber' },
    { 'TermOpen', '*', 'startinsert' },
  },
  dynamic_smartcase = {
    { 'CmdLineEnter', ':', 'set nosmartcase' },
    { 'CmdLineLeave', ':', 'set smartcase' },
  },
  accurate_syntax_highlighting = {
    { 'BufEnter', '*', ':syntax sync fromstart' },
  },
  auto_reload = {
    {
      'FileChangedShellPost',
      '*',
      "lua require('lib.utils').notify('File changed on disk. Buffer reloaded!', vim.log.levels.WARN)",
    },
    { 'FocusGained,CursorHold', '*', "if getcmdwintype() == '' | checktime | endif" },
  },
  toggle_number_on_insert_mode = {
    { 'BufEnter,FocusGained,InsertLeave,WinEnter', '*', 'if &nu | set rnu | endif' },
    { 'BufLeave,FocusLost,InsertEnter,WinLeave', '*', 'if &nu | set nornu | endif' },
  },
  resume_cursor_position = {
    { 'BufReadPost', '*', "lua require('lib.utils').resume_last_cursor_position()" },
  },
  toggle_indent_blankline = {
    { 'InsertEnter', '*', 'IndentBlanklineDisable' },
    { 'InsertLeave', '*', "lua require('lib.plugins').indent_blankline.activate()" },
  },
  format_on_save = {
    {
      'BufWritePre',
      '*',
      'try | undojoin | Neoformat | catch /^Vim\\%((\\a\\+)\\)\\=:E790/ | finally | silent Neoformat | endtry',
    },
  },
  auto_compile_packer = {
    { 'BufWritePost', '*/nvim/lua/plugins.lua', 'source <afile> | PackerCompile' },
  },
  puppet = {
    { 'BufNewFile,BufRead', '*.pp', 'setfiletype puppet' },
    { 'BufNewFile,BufRead', '*.pp', 'set shiftwidth=2 softtabstop=2 filetype=puppet' },
  },
  justfile = {
    { 'BufNewFile,BufRead', 'justfile', 'setf make' },
  },
}

function M.load()
  for gn, cmds in pairs(autocmds) do
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
