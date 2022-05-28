-- Mapping of <leader> (see `:h mapleader`)
vim.g.mapleader = _G.tovim.leader

local map = require('lib.utils').map

map('n', '<leader>ev', '<cmd>tabnew $MYVIMRC<bar>tcd %:h<cr>', { desc = 'Edit $MYVIMRC' })
map('n', '<leader>sv', "<cmd>silent update $MYVIMRC \z
  <bar> source $MYVIMRC \z
  <bar> call v:lua.vim.notify('Neovim configuration successfully reloaded!', \z
  'info', { 'render': 'default', 'title': 'Neovim' })<cr>",
  { desc = 'Update and reload $MYVIMRC' }
)

map('n', 'q;', 'q:', { desc = 'Open the command-line window' })
map('n', 'J', 'mzJ`z', { desc = 'Do not move the cursor when joining lines' })

map('n', '<m-h>', '^', { desc = 'Go to the start of the line' })
map('n', '<m-l>', 'g_', { desc = 'Go to the end of the line' })

map('n', '<leader>w', '<cmd>update<cr>', { desc = 'Write only when the buffer has been modified' })
map('n', '<leader>q', '<cmd>x<cr>', { desc = 'Write only when changes have been made and quit' })
map('n', '<leader>Q', '<cmd>xa<cr>', { desc = 'Write all changed buffers and exit' })
map('n', '<leader>y', '<cmd>%y<cr>', { desc = 'Copy the entire buffer' })
map('n', '<leader>cd', '<cmd>lcd %:p:h<cr><cmd>pwd<cr>', { desc = 'Change current working directory locally and print cwd' })

map('n', '<space>tc', require('lib.utils').toggle_cursorcolumn, { desc = 'Toggle cursorcolumn' })
map('n', '<space><space>', 'a<space><esc>h', { desc = 'Insert a space after the current character' })
map('n', '<space>ao', function() return string.format('m`%so<esc>``', vim.v.count1) end, { expr = true, desc = 'Add a blank line below the current line' })
map('n', '<space>aO', function() return string.format('m`%sO<esc>``', vim.v.count1) end, { expr = true, desc = 'Add a blank line above the current line' })

map('i', '<c-u>', '<esc>viwUea', { desc = 'Turn the word under the cursor into upper case' })

for _, ch in pairs({ ',', '.', '?', ';', ':', '!' }) do
  map('i', ch, ch .. '<c-g>u', { desc = 'Break ' .. ch .. ' into smaller undo units' })
end

-- Better window navigation/resize
map('n', '<left>', '<c-w>h', { desc = 'Move left (window)' })
map('n', '<down>', '<c-w>j', { desc = 'Move down (window)' })
map('n', '<up>', '<c-w>k', { desc = 'Move up (window)' })
map('n', '<right>', '<c-w>l', { desc = 'Move right (window)' })

map('n', '<m-h>', '<c-w>h', { desc = 'Move left (window)' })
map('n', '<m-j>', '<c-w>j', { desc = 'Move down (window)' })
map('n', '<m-k>', '<c-w>k', { desc = 'Move up (window)' })
map('n', '<m-l>', '<c-w>l', { desc = 'Move right (window)' })

map('n', '<s-up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
map('n', '<s-down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<s-left>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })
map('n', '<s-right>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })

-- Continuous visual shifting
map({ 'v', 'x' }, '<', '<gv', { desc = 'Shift right' })
map({ 'v', 'x' }, '>', '>gv', { desc = 'Shift left' })

-- Move text up/down
map('x', '<c-j>', ":move '>+1<cr>gv-gv", { desc = 'Move text down' })
map('x', '<c-k>', ":move '<-2<cr>gv-gv", { desc = 'Move text up' })
