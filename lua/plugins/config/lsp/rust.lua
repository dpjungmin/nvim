--[[ https://github.com/simrat39/rust-tools.nvim ]]

require('rust-tools').setup {
  tools = {
    autoSetHints = true,
    inlay_hints = {
      only_current_line = false,
      show_parameter_hints = true,
      show_variable_name = false,
      parameter_hints_prefix = '',
      other_hints_prefix = '-> ',
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
      highlight = 'InlayHints',
    },
    hover_actions = {
      border = 'single',
      auto_focus = false,
    },
    crate_graph = {
      backend = 'x11',
      output = nil,
      full = true,
      -- https://graphviz.org/docs/outputs/ (Last updated: 2021-08-26)
      enabled_graphviz_backends = {
        'bmp',
        'cgimage',
        'canon',
        'dot',
        'gv',
        'xdot',
        'xdot1.2',
        'xdot1.4',
        'eps',
        'exr',
        'fig',
        'gd',
        'gd2',
        'gif',
        'gtk',
        'ico',
        'cmap',
        'ismap',
        'imap',
        'cmapx',
        'imap_np',
        'cmapx_np',
        'jpg',
        'jpeg',
        'jpe',
        'jp2',
        'json',
        'json0',
        'dot_json',
        'xdot_json',
        'pdf',
        'pic',
        'pct',
        'pict',
        'plain',
        'plain-ext',
        'png',
        'pov',
        'ps',
        'ps2',
        'psd',
        'sgi',
        'svg',
        'svgz',
        'tga',
        'tiff',
        'tif',
        'tk',
        'vml',
        'vmlz',
        'wbmp',
        'webp',
        'xlib',
        'x11',
      },
    },
  },
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
  server = {
    standalone = true,
  },
  dap = {
    adapter = {
      type = 'executable',
      command = 'lldb-vscode',
      name = 'rt_lldb',
    },
  },
}

local map = require('lib.utils').map

map(
  'n',
  'K',
  require('rust-tools.hover_actions').hover_actions,
  { desc = 'Display symbol information at the cursor' }
)
map(
  'n',
  '<space>oc',
  require('rust-tools.open_cargo_toml').open_cargo_toml,
  { desc = 'Open Cargo.toml' }
)
map('n', '<space>rr', require('rust-tools.runnables').runnables, { desc = 'Run a Rust runnable' })
