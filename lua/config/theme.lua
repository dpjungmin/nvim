local t = {
  -- https://github.com/sainnhe/gruvbox-material
  dark = function()
    vim.cmd [[
      set termguicolors
      set background=dark " dark | light

      let g:gruvbox_material_background = 'soft' " 'hard' | 'medium' | 'soft'
      let g:gruvbox_material_foreground = 'mix' " 'material' | 'mix' | 'original'
      let g:gruvbox_material_disable_italic_comment = 0 " 0 | 1
      let g:gruvbox_material_enable_bold = 0 " 0 | 1
      let g:gruvbox_material_enable_italic = 0 " 0 | 1
      let g:gruvbox_material_cursor = 'auto'
      let g:gruvbox_material_transparent_background = 0 " 0 | 1 | 2
      let g:gruvbox_material_visual = 'grey background' " 'grey|green|blue|red background' | 'reverse'
      let g:gruvbox_material_menu_selection_background = 'orange' " 'grey|red|orange|yellow|green|aqua|blue|purple'
      let g:gruvbox_material_sign_column_background = 'none' " 'default' | 'none'
      let g:gruvbox_material_spell_foreground = 'none' " 'none' | 'colored'
      let g:gruvbox_material_ui_contrast = 'low' " 'low' | 'high'
      let g:gruvbox_material_show_eob = 1 " 0 | 1
      let g:gruvbox_material_diagnostic_text_highlight = 0 " 0 | 1
      let g:gruvbox_material_diagnostic_line_highlight = 0 " 0 | 1
      let g:gruvbox_material_diagnostic_virtual_text = 'colored' " 'grey' | 'colored'
      " g:gruvbox_material_current_word
      let g:gruvbox_material_disable_terminal_colors = 0 " 0 | 1
      let g:gruvbox_material_statusline_style = 'mix' " 'material' | 'mix' | 'original'
      let g:gruvbox_material_lightline_disable_bold = 0 " 0 | 1
      let g:gruvbox_material_better_performance = 1 " 0 | 1
      " https://github.com/sainnhe/gruvbox-material/blob/master/autoload/gruvbox_material.vim
      " let g:gruvbox_material_colors_override = {'bg0': ['#1d2021', '234'], 'bg2': ['#282828', '235']}

      function! s:gruvbox_material_custom() abort
        " Link a highlight group to a predefined highlight group.
        " See `colors/gruvbox-material.vim` for all predefined highlight groups.
        highlight! link groupA groupB
        highlight! link groupC groupD

        " Initialize the color palette.
        " The first parameter is a valid value for `g:gruvbox_material_background`,
        " the second parameter is a valid value for `g:gruvbox_material_foreground`,
        " and the third parameter is a valid value for `g:gruvbox_material_colors_override`.
        let l:palette = gruvbox_material#get_palette('hard', 'mix', {})
        " Define a highlight group.
        " The first parameter is the name of a highlight group,
        " the second parameter is the foreground color,
        " the third parameter is the background color,
        " the fourth parameter is for UI highlighting which is optional,
        " and the last parameter is for `guisp` which is also optional.
        " See `autoload/gruvbox_material.vim` for the format of `l:palette`.
        call gruvbox_material#highlight('groupE', l:palette.red, l:palette.none, 'undercurl', l:palette.red)
      endfunction

      augroup GruvboxMaterialCustom
        autocmd!
        " autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
      augroup END

      colorscheme gruvbox-material
      let g:lightline.colorscheme = 'gruvbox_material'
    ]]
  end,
  light = function()
    vim.cmd [[
      set termguicolors
      set background=light " dark | light

      let g:gruvbox_material_background = 'hard' " 'hard' | 'medium' | 'soft'
      let g:gruvbox_material_foreground = 'material' " 'material' | 'mix' | 'original'
      let g:gruvbox_material_disable_italic_comment = 0 " 0 | 1
      let g:gruvbox_material_enable_bold = 0 " 0 | 1
      let g:gruvbox_material_enable_italic = 0 " 0 | 1
      let g:gruvbox_material_cursor = 'auto'
      let g:gruvbox_material_transparent_background = 0 " 0 | 1 | 2
      let g:gruvbox_material_visual = 'grey background' " 'grey|green|blue|red background' | 'reverse'
      let g:gruvbox_material_menu_selection_background = 'orange' " 'grey|red|orange|yellow|green|aqua|blue|purple'
      let g:gruvbox_material_sign_column_background = 'none' " 'default' | 'none'
      let g:gruvbox_material_spell_foreground = 'none' " 'none' | 'colored'
      let g:gruvbox_material_ui_contrast = 'high' " 'low' | 'high'
      let g:gruvbox_material_show_eob = 1 " 0 | 1
      let g:gruvbox_material_diagnostic_text_highlight = 1 " 0 | 1
      let g:gruvbox_material_diagnostic_line_highlight = 1 " 0 | 1
      let g:gruvbox_material_diagnostic_virtual_text = 'colored' " 'grey' | 'colored'
      let g:gruvbox_material_disable_terminal_colors = 0 " 0 | 1
      let g:gruvbox_material_statusline_style = 'material' " 'material' | 'mix' | 'original'
      let g:gruvbox_material_lightline_disable_bold = 1 " 0 | 1
      let g:gruvbox_material_better_performance = 1 " 0 | 1

      colorscheme gruvbox-material
      let g:lightline.colorscheme = 'gruvbox_material'
    ]]
  end,
}

local set_theme = t[_G.tovim.theme]

pcall(set_theme)
