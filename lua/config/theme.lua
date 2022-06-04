local t = {
  dark = function()
    --[[
      '#282828',
      '#3c3836',
      '#504945',
      '#665c54',
      '#bdae93',
      '#d5c4a1',
      '#ebdbb2',
      '#fbf1c7',
      '#fb4934',
      '#fe8019',
      '#fabd2f',
      '#b8bb26',
      '#8ec07c',
      '#83a598',
      '#d3869b',
      '#d65d0e',
    ]]

    vim.g.gruvbox_baby_background_color = 'dark'
    vim.g.gruvbox_baby_transparent_mode = 0
    vim.g.gruvbox_baby_comment_style = 'NONE'
    vim.g.gruvbox_baby_keyword_style = 'NONE'
    vim.g.gruvbox_baby_function_style = 'NONE'
    vim.g.gruvbox_baby_variable_style = 'NONE'

    -- See `h: attr-list` and `:h highlight-guifg`
    -- https://github.com/luisiacc/gruvbox-baby/blob/main/lua/gruvbox-baby/theme.lua
    vim.g.gruvbox_baby_highlights = {
      Normal = { fg = '#d5c4a1', bg = '#282828', style = 'NONE' },
      Comment = { fg = '#fe8019', bg = 'NONE', style = 'NONE' },
      Macro = { fg = '#fb4934', bg = 'NONE', style = 'italic' },
      StorageClass = { fg = '#fabd2f', bg = 'NONE', style = 'NONE' },
      String = { fg = '#b8bb26', bg = 'NONE', style = 'NONE' },
    }

    vim.cmd [[
      colorscheme gruvbox-baby

      set cursorline
      highlight clear Cursorline
      highlight CursorLineNr guifg=#bdae93
    ]]
  end,
}

local set_theme = t[_G.tovim.theme]

if not pcall(set_theme) then
  vim.cmd 'colorscheme default'
end
