local set_theme = {
  melange = function()
    vim.cmd [[
      colorscheme melange

      set cursorline
      highlight clear Cursorline
    ]]
  end,
  gruvbox = function()
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
      Comment = { fg = '#fe8019', bg = 'NONE', style = 'NONE' },
      CursorLineNr = { fg = '#bdae93', bg = 'NONE', style = 'bold' },
      Macro = { fg = '#fb4934', bg = 'NONE', style = 'italic' },
      Normal = { fg = '#d5c4a1', bg = '#282828', style = 'NONE' },
      Special = { fg = '#bdae93', bg = 'NONE', style = 'NONE' },
      StorageClass = { fg = '#fabd2f', bg = 'NONE', style = 'NONE' },
      String = { fg = '#b8bb26', bg = 'NONE', style = 'NONE' },

      ColorColumn = { bg = '#3c3836' },
      SignColumn = { bg = '#282828' },

      -- Treesitter
      TSCharacter = { fg = '#b8bb26', bg = 'NONE', style = 'bold' },
      TSComment = { fg = '#fe8019', bg = 'NONE', style = 'NONE' },
      TSFuncMacro = { fg = '#fb4934', bg = 'NONE', style = 'italic' },
      TSString = { fg = '#b8bb26', bg = 'NONE', style = 'NONE' },
    }

    vim.cmd [[
      colorscheme gruvbox-baby

      set cursorline
      highlight clear Cursorline
    ]]
  end,
  tovim = function()
    --[[
      let g:base16_gui00 = '#1d2021'
      let g:base16_gui01 = '#3c3836'
      let g:base16_gui02 = '#504945'
      let g:base16_gui03 = '#665c54'
      let g:base16_gui04 = '#bdae93'
      let g:base16_gui05 = '#d5c4a1'
      let g:base16_gui06 = '#ebdbb2'
      let g:base16_gui07 = '#fbf1c7'
      let g:base16_gui08 = '#fb4934'
      let g:base16_gui09 = '#fe8019'
      let g:base16_gui0A = '#fabd2f'
      let g:base16_gui0B = '#b8bb26'
      let g:base16_gui0C = '#8ec07c'
      let g:base16_gui0D = '#83a598'
      let g:base16_gui0E = '#d3869b'
      let g:base16_gui0F = '#d65d0e'
    ]]
    vim.cmd [[
      set t_Co=256
      let base16colorspace=256

      colorscheme base16-gruvbox-dark-hard

      " https://github.com/chriskempson/base16-vim/blob/6191622d5806d4448fa2285047936bdcee57a098/colors/base16-gruvbox-dark-hard.vim#L181
      call Base16hi("Comment", g:base16_gui09, "", g:base16_cterm09, "", "", "")
      call Base16hi("LspSignatureActiveParameter", g:base16_gui05, g:base16_gui03, g:base16_cterm05, g:base16_cterm03, "bold", "")
      call Base16hi("Delimiter", g:base16_gui04, "", g:base16_cterm0F, "", "", "")

      set cursorline
      highlight clear Cursorline
    ]]
  end,
}

if not pcall(set_theme[_G.tovim.theme]) then
  vim.cmd 'colorscheme default'
end
