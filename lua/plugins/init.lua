-- https://github.com/folke/lazy.nvim

local function REQUIRE(mod)
  return function()
    require('plugins.' .. mod)
  end
end

return {
  -- Theme
  {
    'dpjungmin/tissue.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local theme = os.getenv 'THEME' or 'tissue-dark'
      vim.cmd('colorscheme ' .. theme)
    end,
  },

  -- Helpful plugins!
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'rktjmp/hotpot.nvim',
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
  'kyazdani42/nvim-web-devicons',
  'windwp/nvim-ts-autotag',
  'hrsh7th/cmp-nvim-lsp',
  'simrat39/rust-tools.nvim',
  'p00f/clangd_extensions.nvim',
  'nvim-lua/plenary.nvim',
  'mfussenegger/nvim-dap',
  'hrsh7th/nvim-cmp',
  'romgrk/fzy-lua-native',
  'onsails/lspkind-nvim',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'mtoohey31/cmp-fish',
  'roxma/nvim-yarp',
  'roxma/vim-hug-neovim-rpc',
  'machakann/vim-swap',
  'machakann/vim-sandwich',
  'itchyny/vim-highlighturl',
  'tpope/vim-commentary',
  'RRethy/vim-illuminate',
  {
    'andymass/vim-matchup',
    keys = {
      '<space>?',
      '<cmd>MatchupWhereAmI?<cr>',
      desc = 'Echos your position in the code in a breadcrumb-style',
    },
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      vim.opt.termguicolors = true
      require('colorizer').setup()
    end,
  },
  {
    'mhinz/vim-startify',
    config = function()
      local g = vim.g
      g.startify_session_dir = g.sessiondir
      g.ascii = { '작은 일에도 최선을' }
      g.startify_custom_header = 'startify#pad(g:ascii)'
      g.startify_lists = {
        { header = { '   sessions' }, type = 'sessions' },
        { header = { '   bookmarks' }, type = 'bookmarks' },
        { header = { '   commands' }, type = 'commands' },
      }
      g.startify_bookmarks = {}
      g.startify_commands = {}
    end,
  },
  {
    'preservim/vim-markdown',
    ft = { 'markdown' },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
    end,
  },
  -- Git
  {
    'lewis6991/gitsigns.nvim',
    config = REQUIRE 'gitsigns',
  },
  { 'tpope/vim-fugitive', keys = { 'gst', '<cmd>Git<cr>', desc = 'Show git status' } },
  {
    'rbong/vim-flog',
    dependencies = { 'tpope/vim-fugitive' },
    keys = { 'gl', '<cmd>Flog<cr>', desc = 'Open git commit graph' },
  },
  -- Language enhancements
  { 'Olical/aniseed', ft = { 'fnl' } },
  {
    'Olical/conjure',
    ft = { 'fnl' },
    config = function()
      vim.cmd 'let g:conjure#client#fennel#aniseed#aniseed_module_prefix = "aniseed."'
    end,
  },
  { 'cespare/vim-toml', ft = { 'toml' } },
  { 'stephpy/vim-yaml', ft = { 'yaml' } },
  { 'dag/vim-fish', ft = { 'fish' } },
  { 'LnL7/vim-nix', ft = { 'nix' } },
  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'onsails/lspkind-nvim',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'mtoohey31/cmp-fish',
    },
    config = REQUIRE 'nvim-cmp',
  },
  -- LSP
  {
    'neovim/nvim-lspconfig',
    tag = 'v0.1.3',
    lazy = false,
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'simrat39/rust-tools.nvim',
      'p00f/clangd_extensions.nvim',
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
      'hrsh7th/nvim-cmp',
    },
    keys = {
      { '<leader><leader>S', '<cmd>LspStart<cr>', desc = 'Start LSP client' },
      { '<leader><leader>s', '<cmd>LspStop<cr>', desc = 'Stop LSP client' },
      {
        '<space>q',
        function()
          vim.diagnostic.setqflist { open = true }
        end,
        desc = 'Add all diagnostics to the quickfix list',
      },
      { '<space>e', vim.diagnostic.open_float, desc = 'Show diagnostics in a floating window' },
      {
        '[d',
        vim.diagnostic.goto_prev,
        desc = 'Move to the previous diagnostic in the current buffer',
      },
      {
        ']d',
        vim.diagnostic.goto_next,
        desc = 'Move to the next diagnostic in the current buffer',
      },
    },
    config = function()
      require 'lang'
    end,
  },
  -- Snippets
  {
    'SirVer/ultisnips',
    config = function()
      local g = vim.g
      g.UltiSnipsSnippetDirectories = { 'UltiSnips', 'snips' }
      g.UltiSnipsJumpForwardTrigger = ':<c-j>'
      g.UltiSnipsJumpBackwardTrigger = ':<c-k>'
    end,
  },
  { 'honza/vim-snippets', dependencies = { 'SirVer/ultisnips' } },
  {
    'quangnguyen30192/cmp-nvim-ultisnips',
    dependencies = { 'hrsh7th/nvim-cmp', 'SirVer/ultisnips' },
  },
  {
    'itchyny/lightline.vim',
    config = REQUIRE 'lightline',
  },
  {
    'karb94/neoscroll.nvim',
    event = 'VimEnter',
    config = REQUIRE 'neoscroll',
  },
  {
    'mhartington/formatter.nvim',
    event = 'VimEnter',
    config = REQUIRE 'formatter',
  },
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = REQUIRE 'which-key',
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = REQUIRE 'nvim-autopairs',
  },
  {
    'akinsho/toggleterm.nvim',
    event = 'VimEnter',
    keys = {
      { '<c-n>', ':<c-u>ToggleTerm direction=vertical<cr>', desc = 'Toggle $TERM vertically' },
      { '<space>ot', ':<c-u>ToggleTerm direction=tab<cr>', desc = 'Open $TERM in a new tab' },
    },
    config = REQUIRE 'toggleterm',
  },
  {
    'gelguy/wilder.nvim',
    event = 'VimEnter',
    dependencies = { 'romgrk/fzy-lua-native' },
    build = ':UpdateRemotePlugins',
    config = REQUIRE 'wilder',
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VimEnter',
    keys = {
      {
        '<space>ti',
        function()
          if vim.g._indent_blankline then
            vim.g._indent_blankline = false
          else
            vim.g._indent_blankline = true
          end
          vim.cmd ':IndentBlanklineToggle'
        end,
        desc = 'Toggle indent-blankline',
      },
    },
    config = REQUIRE 'indent-blankline',
  },
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufEnter',
    build = ':TSUpdate',
    dependencies = { 'windwp/nvim-ts-autotag' },
    config = REQUIRE 'nvim-treesitter',
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = REQUIRE 'nvim-treesitter-context',
  },
  {
    'nvim-treesitter/playground',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  {
    'kyazdani42/nvim-tree.lua',
    tag = 'nightly',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    keys = {
      { '<space>s', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle nvim-tree' },
      {
        '<space>S',
        '<cmd>NvimTreeFindFileToggle<cr>',
        desc = 'Toggle nvim-tree (focus on the current file)',
      },
      {
        '<space><leader>',
        '<cmd>NvimTreeFindFileToggle ' .. vim.g.sessiondir .. '<cr>',
        desc = 'Toggle nvim-tree (open nvim session directory)',
      },
      { '<leader>r', '<cmd>NvimTreeCollapse<cr>', desc = 'Collapse nvim-tree' },
    },
    config = REQUIRE 'nvim-tree',
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<space>.', '<cmd>Telescope find_files<cr>', desc = 'List files in current directory' },
      { '<space>,', '<cmd>Telescope buffers<cr>', desc = 'List open buffers' },
      {
        '<space>g',
        '<cmd>Telescope grep_string<cr>',
        desc = 'Searches for the string under your cursor in your current working directory',
      },
      {
        '<space>G',
        '<cmd>Telescope live_grep<cr>',
        desc = 'Search for a string in your current directory',
      },
      { '<space>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Lists most recently opened files' },
      { '<space>fm', '<cmd>Telescope man_pages<cr>', desc = 'Lists man page entries' },
      { '<space>fh', '<cmd>Telescope help_tags<cr>', desc = 'Lists available help tags' },
      { '<space>fH', '<cmd>Telescope highlights<cr>', desc = 'Lists available highlights' },
      {
        '<space>K',
        '<cmd>Telescope lsp_references<cr>',
        desc = 'Lists LSP references for the work under the cursor',
      },
      {
        '<space>fd',
        '<cmd>Telescope diagnostic<cr>',
        desc = 'Lists diagnostics for all open buffers',
      },
      {
        '<space>i',
        '<cmd>Telescope lsp_implementations<cr>',
        desc = 'Lists implementations of the work under the cursor',
      },
      {
        '<space>fn',
        function()
          require('telescope.builtin').find_files(require('telescope.themes').get_ivy {
            border = true,
            borderchars = {
              preview = {
                '\226\148\128',
                '\226\148\130',
                '\226\148\128',
                '\226\148\130',
                '\226\148\140',
                '\226\148\144',
                '\226\148\152',
                '\226\148\148',
              },
              prompt = {
                '\226\148\128',
                '\226\148\130',
                '\226\148\128',
                '\226\148\130',
                '\226\148\140',
                '\226\148\144',
                '\226\148\152',
                '\226\148\148',
              },
              results = {
                '\226\148\128',
                '\226\148\130',
                '\226\148\128',
                '\226\148\130',
                '\226\148\140',
                '\226\148\144',
                '\226\148\152',
                '\226\148\148',
              },
            },
            layout_config = {
              anchor = 'CENTER',
              prompt_position = 'top',
              mirror = true,
              width = 0.6,
              height = 0.6,
            },
            layout_strategy = 'vertical',
            prompt_prefix = '[nvim config files]: ',
            prompt_title = '',
            preview_title = '',
            sorting_strategy = 'ascending',
            shorten_path = true,
            cwd = '~/.config/nvim',
          })
        end,
        desc = 'List Neovim config files',
      },
    },
    config = REQUIRE 'telescope',
  },
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    config = function()
      require('bqf').setup {}
    end,
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = REQUIRE 'todo-comments',
  },
  {
    'j-hui/fidget.nvim',
    config = REQUIRE 'fidget',
  },
  {
    'simrat39/symbols-outline.nvim',
    keys = {
      { '<space>tS', ':<cmd>SymbolsOutline<cr>', desc = 'Toggle symbols outline' },
    },
    config = REQUIRE 'symbols-outline',
  },
  {
    'saecki/crates.nvim',
    tag = 'v0.2.1',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  },
  {
    'tyru/open-browser.vim',
    config = function()
      vim.cmd [[
        let g:netrw_nogx = 1
        nmap gx <Plug>(openbrowser-smart-search)
        vmap gx <Plug>(openbrowser-smart-search)
      ]]
    end,
  },
  {
    'phaazon/hop.nvim',
    branch = 'v1',
    event = 'VimEnter',
    keys = {
      {
        'J',
        function()
          require('hop').hint_char2()
        end,
        desc = 'Hop to the occurrence of a bigram',
      },
    },
    config = function()
      vim.defer_fn(function()
        require('hop').setup {
          quit_key = '<esc>',
          case_insensitive = true,
          char2_fallback_key = '<cr>',
        }
      end, 2000)
    end,
  },
  {
    'akinsho/bufferline.nvim',
    event = 'VimEnter',
    keys = {
      { '<space>1', '<cmd>BufferLineGoToBuffer 1<cr>', desc = 'Go to buffer 1' },
      { '<space>2', '<cmd>BufferLineGoToBuffer 2<cr>', desc = 'Go to buffer 2' },
      { '<space>3', '<cmd>BufferLineGoToBuffer 3<cr>', desc = 'Go to buffer 3' },
      { '<space>4', '<cmd>BufferLineGoToBuffer 4<cr>', desc = 'Go to buffer 4' },
      { '<space>5', '<cmd>BufferLineGoToBuffer 5<cr>', desc = 'Go to buffer 5' },
      { '<space>6', '<cmd>BufferLineGoToBuffer 6<cr>', desc = 'Go to buffer 6' },
      { '<space>7', '<cmd>BufferLineGoToBuffer 7<cr>', desc = 'Go to buffer 7' },
      { '<space>8', '<cmd>BufferLineGoToBuffer 8<cr>', desc = 'Go to buffer 8' },
      { '<space>9', '<cmd>BufferLineGoToBuffer 9<cr>', desc = 'Go to buffer 9' },
      { '<space>bp', '<cmd>BufferLineTogglePin<cr>', desc = 'Toggle pin for current buffer' },
      { '<tab>', '<cmd>BufferLineCycleNext<cr>', desc = 'Go to the next buffer' },
      { '<s-tab>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Go to the previous buffer' },
      {
        '<s-l>',
        '<cmd>BufferLineMoveNext<cr>',
        desc = 'Move the current buffer to the next buffer position',
      },
      {
        '<s-h>',
        '<cmd>BufferLineMovePrev<cr>',
        desc = 'Move the current buffer to the previous buffer position',
      },
    },
    config = REQUIRE 'bufferline',
  },
}
