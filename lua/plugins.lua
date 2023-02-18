-- https://github.com/wbthomason/packer.nvim

local plugins = {
  -- Helpful plugins!
  {
    {
      'lewis6991/impatient.nvim',
      config = function()
        require 'impatient'
      end,
    },
    'wbthomason/packer.nvim',
    'rktjmp/hotpot.nvim',
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'andymass/vim-matchup',
    'machakann/vim-swap',
    'machakann/vim-sandwich',
    'itchyny/vim-highlighturl',
    'jdhao/better-escape.vim',
    'tpope/vim-commentary',
    'RRethy/vim-illuminate',
    {
      'norcalli/nvim-colorizer.lua',
      config = function()
        require('colorizer').setup()
      end,
    },
  },

  -- Configuration is set in `fnl/global.fnl`
  {
    'mhinz/vim-startify',
    { 'preservim/vim-markdown', ft = { 'markdown' } },
    {
      'iamcco/markdown-preview.nvim',
      ft = { 'markdown' },
      run = function()
        vim.fn['mkdp#util#install']()
      end,
    },
  },

  -- Git
  {
    {
      'lewis6991/gitsigns.nvim',
      config = function()
        require 'config.gitsigns'
      end,
    },
    { 'rbong/vim-flog', requires = { 'tpope/vim-fugitive' } },
  },

  -- Language enhancements
  {
    { 'Olical/aniseed', ft = { 'fnl' } },
    { 'Olical/conjure', ft = { 'fnl' } },
    { 'cespare/vim-toml', ft = { 'toml' } },
    { 'stephpy/vim-yaml', ft = { 'yaml' } },
    { 'dag/vim-fish', ft = { 'fish' } },
    { 'LnL7/vim-nix', ft = { 'nix' } },
  },

  -- Completion
  {
    'hrsh7th/nvim-cmp',
    requires = {
      'onsails/lspkind-nvim',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'mtoohey31/cmp-fish',
    },
    config = function()
      require 'config.nvim-cmp'
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
    },
    after = 'nvim-cmp',
    config = function()
      require 'lang'
    end,
  },

  -- Snippets
  {
    'SirVer/ultisnips',
    { 'honza/vim-snippets', after = 'ultisnips' },
    { 'quangnguyen30192/cmp-nvim-ultisnips', after = { 'nvim-cmp', 'ultisnips' } },
  },

  {
    'itchyny/lightline.vim',
    config = function()
      require 'config.lightline'
    end,
  },
  {
    'karb94/neoscroll.nvim',
    event = 'VimEnter',
    config = function()
      require 'config.neoscroll'
    end,
  },
  {
    'mhartington/formatter.nvim',
    event = 'VimEnter',
    config = function()
      require 'config.formatter'
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require 'config.which-key'
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require 'config.nvim-autopairs'
    end,
  },
  {
    'akinsho/toggleterm.nvim',
    event = 'VimEnter',
    config = function()
      require 'config.toggleterm'
    end,
  },
  {
    'gelguy/wilder.nvim',
    event = 'VimEnter',
    requires = { 'romgrk/fzy-lua-native' },
    run = ':UpateRemotePlugins',
    config = function()
      require 'config.wilder'
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = 'VimEnter',
    config = function()
      require 'config.indent-blankline'
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufEnter',
    run = ':TSUpdate',
    requires = { 'windwp/nvim-ts-autotag' },
    config = function()
      require 'config.nvim-treesitter'
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    after = { 'nvim-treesitter' },
    config = function()
      require 'config.nvim-treesitter-context'
    end,
  },
  {
    'nvim-treesitter/playground',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    after = 'nvim-treesitter',
  },
  {
    'kyazdani42/nvim-tree.lua',
    tag = 'nightly',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'config.nvim-tree'
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require 'config.telescope'
    end,
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
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require 'config.todo-comments'
    end,
  },
  {
    'j-hui/fidget.nvim',
    config = function()
      require 'config.fidget'
    end,
  },
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      require 'config.symbols-outline'
    end,
  },
  {
    'saecki/crates.nvim',
    tag = 'v0.2.1',
    requires = { 'nvim-lua/plenary.nvim' },
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

local spec = {
  function(use)
    for _, p in ipairs(plugins) do
      local ok, msg = pcall(use, p)

      if not ok then
        vim.notify(msg, vim.log.levels.ERROR)
      end
    end

    -- Lazy-load colorscheme
    use {
      'dpjungmin/tissue.nvim',
      config = function()
        local theme = os.getenv 'THEME' or 'tissue'
        vim.cmd('colorscheme ' .. theme)
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
    display = {
      open_fn = function()
        return require('packer.util').float { border = 'single' }
      end,
      prompt_border = 'single',
    },
    autoremove = true,
  },
}

require('packer').startup(spec)

if _G['install-packages'] then
  require('packer').sync()
  vim.notify 'Re-start Neovim after packages are installed'
  return
end

if not pcall(require, 'packer_compiled') then
  vim.notify 'Error requiring "packer_compiled.lua". Run PackerSync to fix!'
end
