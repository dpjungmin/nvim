--[[ https://github.com/goolord/alpha-nvim ]]

local alpha = require 'alpha'
local dashboard = require 'alpha.themes.dashboard'

-- Set header
dashboard.section.header.val = {
  [[]],
  [[]],
  [[ ___________  ______  ___      ___  __     ___      ___  ]],
  [[("     _   ")/    " \|"  \    /"  ||" \   |"  \    /"  | ]],
  [[ )__/  \\__/// ____  \\   \  //  / ||  |   \   \  //   | ]],
  [[    \\_ /  /  /    ) :)\\  \/. ./  |:  |   /\\  \/.    | ]],
  [[    |.  | (: (____/ //  \.    //   |.  |  |: \.        | ]],
  [[    \:  |  \        /    \\   /    /\  |\ |.  \    /:  | ]],
  [[     \__|   \"_____/      \__/    (__\_|_)|___|\__/|___| ]],
  [[]],
  [[]],
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button('Space .', '  Find file', '<cmd>Leaderf file --bottom<cr>', {}),
    dashboard.button('Space f r', '  Recent files', '<cmd>Leaderf mru --bottom<cr>', {}),
    dashboard.button('Space g', '  Project grep', '<cmd>Leaderf rg --fullScreen<cr>', {}),
    dashboard.button('e', '  New file' , '<cmd>enew<cr>', {}),
    dashboard.button('q', '  Quit', '<cmd>qa<cr>', {}),
}

dashboard.config.opts.noautocmd = true
vim.cmd "autocmd User AlphaReady echo 'ready'"
alpha.setup(dashboard.config)
