-- https://github.com/folke/lazy.nvim

local function REQUIRE(mod)
  require('plugins.' .. mod)
end

return {
  -- Theme
  {
    'dpjungmin/tissue.nvim',
    lazy = false,
    priority = 999,
    config = function()
      vim.opt.termguicolors = true
      local theme = os.getenv 'THEME' or 'tissue-dark'
      vim.cmd('colorscheme ' .. theme)
    end,
  },

  -- Dependencies
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

  -- Helpful plugins!
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'rktjmp/hotpot.nvim',
  {
    'andymass/vim-matchup',
    keys = {
      '<space>?',
      '<cmd>MatchupWhereAmI?<cr>',
      desc = 'Echos your position in the code in a breadcrumb-style',
    },
  },
  'machakann/vim-swap',
  'machakann/vim-sandwich',
  'itchyny/vim-highlighturl',
  'tpope/vim-commentary',
  'RRethy/vim-illuminate',
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },

  -- Configuration is set in `fnl/global.fnl`
  'mhinz/vim-startify',
  { 'preservim/vim-markdown', ft = { 'markdown' } },

  -- Git
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      REQUIRE 'gitsigns'
    end,
  },
  { 'tpope/vim-fugitive', keys = { 'gst', '<cmd>Git<cr>', desc = 'Show git status' } },
  {
    'rbong/vim-flog',
    dependencies = { 'tpope/vim-fugitive' },
    keys = { 'gl', '<cmd>Flog<cr>', desc = 'Open git commit graph' },
  },

  -- Language enhancements
  { 'Olical/aniseed', ft = { 'fnl' } },
  { 'Olical/conjure', ft = { 'fnl' } },
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
    config = function()
      REQUIRE 'nvim-cmp'
    end,
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    tag = 'v0.1.3',
    requires = {
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
  'SirVer/ultisnips',
  { 'honza/vim-snippets', dependencies = { 'SirVer/ultisnips' } },
  {
    'quangnguyen30192/cmp-nvim-ultisnips',
    dependencies = { 'hrsh7th/nvim-cmp', 'SirVer/ultisnips' },
  },

  {
    'itchyny/lightline.vim',
    config = function()
      REQUIRE 'lightline'
    end,
  },
  {
    'karb94/neoscroll.nvim',
    event = 'VimEnter',
    config = function()
      REQUIRE 'neoscroll'
    end,
  },
  {
    'mhartington/formatter.nvim',
    event = 'VimEnter',
    config = function()
      REQUIRE 'formatter'
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      REQUIRE 'which-key'
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      REQUIRE 'nvim-autopairs'
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    event = 'VimEnter',
    keys = {
      { '<c-n>', ':<c-u>ToggleTerm direction=vertical<cr>', desc = 'Toggle $TERM vertically' },
      { '<space>ot', ':<c-u>ToggleTerm direction=tab<cr>', desc = 'Open $TERM in a new tab' },
    },
    config = function()
      REQUIRE 'toggleterm'
    end,
  },

  {
    'gelguy/wilder.nvim',
    event = 'VimEnter',
    dependencies = { 'romgrk/fzy-lua-native' },
    build = ':UpdateRemotePlugins',
    config = function()
      REQUIRE 'wilder'
    end,
  },

  -- https://github.com/lukas-reineke/indent-blankline.nvim
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
    config = function()
      REQUIRE 'indent-blankline'
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufEnter',
    build = ':TSUpdate',
    dependencies = { 'windwp/nvim-ts-autotag' },
    config = function()
      REQUIRE 'nvim-treesitter'
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      REQUIRE 'nvim-treesitter-context'
    end,
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
        desc = 'Toggle nvim-tree',
        desc = 'Toggle nvim-tree (open nvim session directory)',
      },
      { '<leader>r', '<cmd>NvimTreeCollapse<cr>', desc = 'Collapse nvim-tree' },
    },
    config = function()
      REQUIRE 'nvim-tree'
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<space>.', '<cmd>Telescope find-files<cr>', desc = 'List files in current directory' },
      { '<space>.', '<cmd>Telescope find-files<cr>', desc = 'List files in current directory' },
    },
    config = function()
      REQUIRE 'telescope'
    end,
  },

  -- ; https://github.com/nvim-telescope/telescope.nvim
  -- (map! [n] :<space>. "<cmd>Telescope find_files<cr>" {:desc "List files in current directory"})
  -- (map! [n] :<space>g "<cmd>Telescope grep_string<cr>" {:desc "Searches for the string under your cursor in your current working directory"})
  -- (map! [n] :<space>G "<cmd>Telescope live_grep<cr>" {:desc "Search for a string in your current directory"})
  -- (map! [n] "<space>," "<cmd>Telescope buffers<cr>" {:desc "List open buffers"})
  -- (map! [n] :<space>fr "<cmd>Telescope oldfiles<cr>" {:desc "Lists most recently opened files"})
  -- (map! [n] :<space>fm "<cmd>Telescope man_pages<cr>" {:desc "Lists man page entries"})
  -- (map! [n] :<space>fh "<cmd>Telescope help_tags<cr>" {:desc "List available help tags"})
  -- (map! [n] :<space>fH "<cmd>Telescope highlights<cr>" {:desc "List available highlights"})
  -- (map! [n] :<space>K "<cmd>Telescope lsp_references<cr>" {:desc "Lists LSP references for the work under the cursor"})
  -- (map! [n] :<space>fd "<cmd>Telescope diagnostics<cr>" {:desc "Lists diagnostics for all open buffers"})
  -- (map! [n] :<space>i "<cmd>Telescope lsp_implementations<cr>" {:desc "Lists implementations of the work under the cursor"})
  -- (map! [n] :<space>fn
  --   (fn []
  --     (local find-files (. (require :telescope.builtin) :find_files))
  --     (local get-ivy (. (require :telescope.themes) :get_ivy))
  --     (find-files (get-ivy {:border true
  --                           :borderchars {:preview [" " "│" "─" "│" " " "│" "┘" "─"]
  --                                         :prompt ["─" "│" "─" "│" "┌" "┐" "┘" "└"]
  --                                         :results ["─" " " "─" "│" "┌" "┐" "─" "└"]}
  --                           :layout_config {:prompt_position :top
  --                                           :mirror false
  --                                           :height 0.4}
  --                           :layout_strategy :bottom_pane
  --                           :cwd "~/.config/nvim"
  --                           :prompt ""
  --                           :prompt_prefix "[nvim config files]: "
  --                           :shorten_path true
  --                           :sorting_strategy :ascending})))
  --   {:desc "List Neovim config files"})

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
    config = function()
      REQUIRE 'todo-comments'
    end,
  },
  {
    'j-hui/fidget.nvim',
    config = function()
      REQUIRE 'fidget'
    end,
  },
  -- https://github.com/simrat39/symbols-outline.nvim
  {
    'simrat39/symbols-outline.nvim',
    keys = {
      { '<space>tS', ':<cmd>SymbolsOutline<cr>', desc = 'Toggle symbols outline' },
    },
    config = function()
      REQUIRE 'symbols-outline'
    end,
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
  -- https://github.com/phaazon/hop.nvim
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
}
