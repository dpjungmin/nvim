--[[ https://github.com/wbthomason/packer.nvim ]]

require('packer').startup {
  function(use)
    -- It is recommened to put `impatient.nvim` before any other plugins
    use { 'lewis6991/impatient.nvim', config = "require('impatient')" }

    --[[ Themes ]]
    use {
      'sainnhe/gruvbox-material',
      'luisiacc/gruvbox-baby',
    }

    --[[ Use default configuration ]]
    use {
      'wbthomason/packer.nvim',
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      { 'norcalli/nvim-colorizer.lua', config = "require('colorizer').setup()" }, -- Neovim colorizer
      { 'machakann/vim-swap', event = 'VimEnter' }, -- `g>`, `g<`, and `gs` (swap-mode) to swap arguments
      { 'machakann/vim-sandwich', event = 'VimEnter' }, -- `saiw(` makes foo to (foo), `sdb` makes (foo) to foo, `srb]` makes (foo) to [foo]
      { 'itchyny/vim-highlighturl', event = 'VimEnter' }, -- Highlight URL
      { 'windwp/nvim-ts-autotag', event = 'InsertEnter' }, -- Use treesitter to auto-close and auto-rename html tag
      { 'tpope/vim-commentary', event = 'VimEnter' }, -- `gcc` to comment stuff out
    }

    --[[ Use custom configuration ]]
    use {
      { 'folke/zen-mode.nvim', config = "require('config.zen-mode')" },
      { 'karb94/neoscroll.nvim', config = "require('config.neoscroll')" },
      { 'andymass/vim-matchup', config = "require('config.vim-matchup')" },
      { 'simnalamburt/vim-mundo', config = "require('config.vim-mundo')" },
      { 'sbdchd/neoformat', config = "require('config.neoformat')" },
      { 'jdhao/better-escape.vim', config = function()
        -- https://github.com/jdhao/better-escape.vim
        vim.g.better_escape_shortcut = 'jj'
        vim.g.better_escape_interval = 200
      end,
      },
      {
        'folke/which-key.nvim',
        event = 'VimEnter',
        config = "require('config.which-key')",
      },
      {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        event = 'VimEnter',
        setup = "require('config.theme')", -- Theme must be set before loading this plugin
        config = "require('config.lualine')",
      },
      {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end,
        ft = { 'markdown' },
        config = "require('config.markdown-preview')",
      },
      {
        'Yggdroot/LeaderF',
        run = ':LeaderfInstallCExtension',
        config = "require('config.LeaderF')",
      },
      {
        'goolord/alpha-nvim',
        event = 'VimEnter',
        config = "require('config.alpha-nvim')",
      },
      {
        'jdhao/whitespace.nvim',
        event = 'VimEnter',
        config = "require('config.whitespace')",
      },
      {
        'tyru/open-browser.vim',
        event = 'VimEnter',
        config = "require('config.open-browser')",
      },
      {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = "require('config.nvim-autopairs')",
      },
      {
        'akinsho/toggleterm.nvim',
        event = 'VimEnter',
        config = "require('config.toggleterm')",
      },
      {
        'gelguy/wilder.nvim',
        requires = { 'romgrk/fzy-lua-native' } ,
        config = "require('config.wilder')",
      },
      {
        'lukas-reineke/indent-blankline.nvim',
        event = 'VimEnter',
        config = "require('config.indent-blankline')",
      },
      {
        'nvim-treesitter/nvim-treesitter',
        event = 'BufEnter',
        run = ':TSUpdate',
        config = "require('config.nvim-treesitter')",
      },
      {
        'akinsho/bufferline.nvim',
        tag = 'v2.*',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        event = 'VimEnter',
        config = "require('config.bufferline')",
      },
      {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = "require('config.nvim-tree')",
      },
      {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = "require('config.telescope')",
      },
      {
        'kevinhwang91/nvim-bqf',
        ft = 'qf',
        config = "require('config.nvim-bqf')",
      },
      {
        'Pocco81/AutoSave.nvim',
        event = 'VimEnter',
        config = function()
          vim.defer_fn(function() require('config.AutoSave') end, 1500)
        end,
      },
      {
        'rcarriga/nvim-notify',
        requires = { 'michaelb/vim-tips' },
        event = 'BufEnter',
        config = function()
          vim.defer_fn(function() require('config.nvim-notify') end, 2000)
        end,
      },
      {
        'phaazon/hop.nvim',
        branch = 'v1',
        event = 'VimEnter',
        config = function()
          vim.defer_fn(function() require('config.hop') end, 2000)
        end,
      },
    }

    -- Git
    use {
      { 'lewis6991/gitsigns.nvim', config = "require('config.gitsigns')" },
      { 'tpope/vim-fugitive', config = "require('config.vim-fugitive')" },
      {
        'rbong/vim-flog',
        requires = { 'tpope/vim-fugitive' },
        config = "require('config.vim-flog')",
      },
    }

    -- Language support
    use {
      -- LSP
      {
        'neovim/nvim-lspconfig',
        requires = {
          'williamboman/nvim-lsp-installer',
          'hrsh7th/cmp-nvim-lsp',
          'simrat39/rust-tools.nvim',
          'p00f/clangd_extensions.nvim',
          'nvim-lua/plenary.nvim',
          'mfussenegger/nvim-dap',
        },
        after = 'cmp-nvim-lsp',
        config = "require('config.lsp')",
      },
      { 'jose-elias-alvarez/null-ls.nvim', config = "require('config.null-ls')" },
      -- Auto-completion
      {
        'hrsh7th/nvim-cmp',
        requires = { 'onsails/lspkind-nvim' },
        after = 'lspkind-nvim',
        config = "require('config.nvim-cmp')",
      },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-omni', after = 'nvim-cmp' },
      -- Snippets
      { 'SirVer/ultisnips' },
      { 'honza/vim-snippets', after = 'ultisnips' },
      { 'quangnguyen30192/cmp-nvim-ultisnips', after = { 'nvim-cmp', 'ultisnips' }},
      -- Language enhancements
      {
          'saecki/crates.nvim',
          tag = 'v0.2.1',
          requires = { 'nvim-lua/plenary.nvim' },
          config = "require('config.crates')",
      },
      { 'preservim/vim-markdown', ft = { 'markdown' }, config = "require('config.vim-markdown')" },
      { 'cespare/vim-toml', ft = { 'toml' }},
      { 'stephpy/vim-yaml', ft = { 'yaml' }},
    }
  end,
  config = {
    max_jobs = 16,
    compile_path = require('packer.util').join_paths(
      vim.fn.stdpath('data'), 'site', 'lua', 'packer_compiled.lua'
    ),
  },
}

if not pcall(require, 'packer_compiled') then
  vim.notify('Error requiring "packer_compiled.lua". Run PackerSync to fix!')
end
