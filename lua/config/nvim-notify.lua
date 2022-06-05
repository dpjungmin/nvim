--[[ https://github.com/rcarriga/nvim-notify ]]

if not _G.tovim.enable_notify then
  return
end

-- See `:h vim.log.levels`
local nvim_notify = require('notify')

nvim_notify.setup {
  background_colour = 'Normal',
  fps = 50,
  icons = {
    DEBUG = '',
    ERROR = '',
    INFO = '',
    TRACE = '✎',
    WARN = ''
  },
  level = 'info',
  minimum_width = 20,
  render = 'minimal', -- 'default' | 'minimal'
  stages = 'static', -- 'fade_in_slide_out' | 'fade' | 'slide' | 'static'
  timeout = 2000,
}

-- Default highlights
vim.cmd([[
  highlight NotifyERRORBorder guifg=#8A1F1F
  highlight NotifyWARNBorder guifg=#79491D
  highlight NotifyINFOBorder guifg=#4F6752
  highlight NotifyDEBUGBorder guifg=#8B8B8B
  highlight NotifyTRACEBorder guifg=#4F3552
  highlight NotifyERRORIcon guifg=#F70067
  highlight NotifyWARNIcon guifg=#F79000
  highlight NotifyINFOIcon guifg=#A9FF68
  highlight NotifyDEBUGIcon guifg=#8B8B8B
  highlight NotifyTRACEIcon guifg=#D484FF
  highlight NotifyERRORTitle guifg=#F70067
  highlight NotifyWARNTitle guifg=#F79000
  highlight NotifyINFOTitle guifg=#A9FF68
  highlight NotifyDEBUGTitle guifg=#8B8B8B
  highlight NotifyTRACETitle guifg=#D484FF
  highlight link NotifyERRORBody Normal
  highlight link NotifyWARNBody Normal
  highlight link NotifyINFOBody Normal
  highlight link NotifyDEBUGBody Normal
  highlight link NotifyTRACEBody Normal
]])

-- Add padding for each message
vim.notify = function(msg, level, opts)
  nvim_notify(' ' .. msg .. ' ', level, opts)
end
