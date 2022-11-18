--[[ https://github.com/wbthomason/packer.nvim ]]

require('packer').startup {
  function(use)
    use {
      -- It is recommened to put `impatient.nvim` before any other plugins
      { 'lewis6991/impatient.nvim', config = "require('impatient')" },
      { 'wbthomason/packer.nvim' }, -- Package manager
    }

    use {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
    }

    --[[ Use default configuration ]]
    use {
      { 'machakann/vim-swap', event = 'VimEnter' }, -- `g>`, `g<`, and `gs` (swap-mode) to swap arguments
      { 'machakann/vim-sandwich', event = 'VimEnter' }, -- `saiw(` makes foo to (foo), `sdb` makes (foo) to foo, `srb]` makes (foo) to [foo]
      { 'itchyny/vim-highlighturl', event = 'VimEnter' }, -- Highlight URL
      { 'windwp/nvim-ts-autotag', event = 'InsertEnter' }, -- Use treesitter to auto-close and auto-rename html tag
      { 'tpope/vim-commentary', event = 'VimEnter' }, -- `gcc` to comment stuff out
      {
        'norcalli/nvim-colorizer.lua',
        event = 'VimEnter',
        config = "require('colorizer').setup()",
      },
    }

    --[[ Configuration set in 'global.lua' ]]
    use {
      'mhinz/vim-startify',
      'jdhao/better-escape.vim',
      { 'preservim/vim-markdown', ft = { 'markdown' } },
    }

    --[[ Use custom configuration ]]
    use {
      { 'karb94/neoscroll.nvim', config = "require('plugins.config.neoscroll')" },
      { 'andymass/vim-matchup', config = "require('plugins.config.vim-matchup')" },
      { 'simnalamburt/vim-mundo', config = "require('plugins.config.vim-mundo')" },
      { 'sbdchd/neoformat', config = "require('plugins.config.neoformat')" },
      {
        'folke/which-key.nvim',
        event = 'VimEnter',
        config = "require('plugins.config.which-key')",
      },
      {
        'itchyny/lightline.vim',
        config = "require('plugins.config.lightline')",
      },
      {
        'jdhao/whitespace.nvim',
        event = 'VimEnter',
        config = "require('plugins.config.whitespace')",
      },
      {
        'tyru/open-browser.vim',
        event = 'VimEnter',
        config = "require('plugins.config.open-browser')",
      },
      {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = "require('plugins.config.nvim-autopairs')",
      },
      {
        'akinsho/toggleterm.nvim',
        event = 'VimEnter',
        config = "require('plugins.config.toggleterm')",
      },
      {
        'gelguy/wilder.nvim',
        requires = { 'romgrk/fzy-lua-native' },
        config = "require('plugins.config.wilder')",
      },
      {
        'lukas-reineke/indent-blankline.nvim',
        event = 'VimEnter',
        config = "require('plugins.config.indent-blankline')",
      },
      {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufEnter',
        run = ':TSUpdate',
        config = "require('plugins.config.nvim-treesitter')",
      },
      {
        'nvim-treesitter/playground',
        requires = {
          'nvim-treesitter/nvim-treesitter',
          'nvim-treesitter/nvim-treesitter-context',
        },
        after = 'nvim-treesitter',
      },
      {
        'akinsho/bufferline.nvim',
        tag = 'v2.*',
        requires = { 'kyazdani42/nvim-web-devicons' },
        event = 'VimEnter',
        config = "require('plugins.config.bufferline')",
      },
      {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons' },
        tag = 'nightly',
        config = "require('plugins.config.nvim-tree')",
      },
      {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = { 'nvim-lua/plenary.nvim' },
        config = "require('plugins.config.telescope')",
      },
      {
        'kevinhwang91/nvim-bqf',
        ft = 'qf',
        config = "require('plugins.config.nvim-bqf')",
      },
      {
        'phaazon/hop.nvim',
        branch = 'v1',
        event = 'VimEnter',
        config = function()
          vim.defer_fn(function()
            require 'plugins.config.hop'
          end, 2000)
        end,
      },
    }

    -- Git
    use {
      { 'lewis6991/gitsigns.nvim', config = "require('plugins.config.gitsigns')" },
      { 'tpope/vim-fugitive', config = "require('plugins.config.vim-fugitive')" },
      {
        'rbong/vim-flog',
        requires = { 'tpope/vim-fugitive' },
        config = "require('plugins.config.vim-flog')",
      },
    }

    -- Language support
    use {
      -- Auto-completion
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      {
        'hrsh7th/nvim-cmp',
        requires = { 'onsails/lspkind-nvim' },
        after = 'lspkind-nvim',
        config = "require('plugins.config.nvim-cmp')",
      },
      { 'mtoohey31/cmp-fish', ft = 'fish' },
      -- Snippets
      { 'SirVer/ultisnips' },
      { 'honza/vim-snippets', after = 'ultisnips' },
      { 'quangnguyen30192/cmp-nvim-ultisnips', after = { 'nvim-cmp', 'ultisnips' } },
      -- Language enhancements
      { 'simrat39/symbols-outline.nvim', config = "require('plugins.config.symbols-outline')" },
      {
        'saecki/crates.nvim',
        tag = 'v0.2.1',
        requires = { 'nvim-lua/plenary.nvim' },
        config = "require('plugins.config.crates')",
      },
      {
        'iamcco/markdown-preview.nvim',
        run = function()
          vim.fn['mkdp#util#install']()
        end,
        ft = { 'markdown' },
        config = "require('plugins.config.markdown-preview')",
      },
      { 'cespare/vim-toml', ft = { 'toml' } },
      { 'stephpy/vim-yaml', ft = { 'yaml' } },
      { 'jaawerth/fennel.vim', ft = { 'fnl' } },
      -- LSP
      {
        'neovim/nvim-lspconfig',
        tag = 'v0.1.3',
        requires = {
          'williamboman/nvim-lsp-installer',
          'hrsh7th/cmp-nvim-lsp',
          'simrat39/rust-tools.nvim',
          'p00f/clangd_extensions.nvim',
          'nvim-lua/plenary.nvim',
          'mfussenegger/nvim-dap',
        },
        after = 'nvim-cmp',
        config = "require('plugins.config.lsp')",
      },
      {
        'j-hui/fidget.nvim',
        config = "require('plugins.config.fidget')",
      },
    }

    -- Load theme
    use {
      vim.fn.stdpath 'config' .. '/lua/theme',
      after = { 'bufferline.nvim' },
      config = function()
        require 'theme'
      end,
    }
  end,
  config = {
    max_jobs = 16,
    compile_path = require('packer.util').join_paths(
      vim.fn.stdpath 'data',
      'site',
      'lua',
      'packer_compiled.lua'
    ),
  },
}

if not pcall(require, 'packer_compiled') then
  require('lib.utils').notify 'Error requiring "packer_compiled.lua". Run PackerSync to fix!'
end
