-- https://github.com/wbthomason/packer.nvim

-- stylua: ignore
(require 'packer').startup {
  function(use)
    use {
      'wbthomason/packer.nvim',
      'rktjmp/hotpot.nvim',
      { 'lewis6991/impatient.nvim', config = [[require'impatient']] },
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
    }

    -- use default configuration
    use {
      'andymass/vim-matchup',
      'machakann/vim-swap',
      'machakann/vim-sandwich',
      'itchyny/vim-highlighturl',
      'windwp/nvim-ts-autotag',
      'tpope/vim-commentary',
      'RRethy/vim-illuminate',
      { 'norcalli/nvim-colorizer.lua', config = [[require('colorizer').setup()]] },
    }

    -- configuration is set in `global.fnl`
    use {
      'mhinz/vim-startify',
      { 'jdhao/better-escape.vim', event = 'VimEnter' },
      { 'preservim/vim-markdown', ft = { 'markdown' } },
      { 'jdhao/whitespace.nvim', event = 'VimEnter' },
      { 'iamcco/markdown-preview.nvim', ft = { 'markdown' }, run = function() vim.fn['mkdp#util#install']() end },
    }

    -- use custom configuration
    use {
      { 'itchyny/lightline.vim', config = [[require'config.lightline']] },
      { 'karb94/neoscroll.nvim', event = 'VimEnter', config = [[require'config.neoscroll']] },
      { 'mhartington/formatter.nvim', event = 'VimEnter', config = [[require'config.formatter']] },
      { 'folke/which-key.nvim', event = 'VimEnter', config = [[require'config.which-key']] },
      { 'windwp/nvim-autopairs', event = 'InsertEnter', config = [[require'config.nvim-autopairs']] },
      { 'akinsho/toggleterm.nvim', event = 'VimEnter', config = [[require'config.toggleterm']] },
      { 'gelguy/wilder.nvim', event = 'VimEnter', requires = { 'romgrk/fzy-lua-native' }, run = ':UpateRemotePlugins', config = [[require'config.wilder']] },
      { 'lukas-reineke/indent-blankline.nvim', event = 'VimEnter', config = [[require'config.indent-blankline']] },
      { 'nvim-treesitter/nvim-treesitter', event = 'BufEnter', run = ':TSUpdate', config = [[require'config.nvim-treesitter']] },
      { 'nvim-treesitter/nvim-treesitter-context', after = { 'nvim-treesitter' }, config = [[require'config.nvim-treesitter-context']] },
      { 'nvim-treesitter/playground', requires = { 'nvim-treesitter/nvim-treesitter' }, after = 'nvim-treesitter' },
      { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }, tag = 'nightly', config = [[require'config.nvim-tree']] },
      { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { 'nvim-lua/plenary.nvim' }, config = [[require'config.telescope']] },
      { 'kevinhwang91/nvim-bqf', ft = 'qf', config = "require('bqf').setup {}" },
      { 'folke/todo-comments.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = [[require'config.todo-comments']] },
      { 'j-hui/fidget.nvim', config = [[require'config.fidget']] },
      { 'simrat39/symbols-outline.nvim', config = [[require'config.symbols-outline']] },
      { 'saecki/crates.nvim', tag = 'v0.2.1', requires = { 'nvim-lua/plenary.nvim' }, config = [[require('crates').setup()]] },
      { 'tyru/open-browser.vim', config = function()
        vim.cmd [[
          let g:netrw_nogx = 1

          nmap gx <Plug>(openbrowser-smart-search)
          vmap gx <Plug>(openbrowser-smart-search)
        ]]
      end },
      { 'phaazon/hop.nvim', branch = 'v1', event = 'VimEnter', config = function()
        vim.defer_fn(function()
          (require 'hop').setup {
            quit_key = '<esc>',
            case_insensitive = true,
            char2_fallback_key = '<cr>',
          }
        end, 2000)
      end },
    }

    -- git
    use {
      'tpope/vim-fugitive',
      { 'lewis6991/gitsigns.nvim', config = [[require'config.gitsigns']] },
      { 'rbong/vim-flog', requires = { 'tpope/vim-fugitive' } },
    }

    -- language support
    use {
      -- enhancements
      'Olical/aniseed',
      { 'Olical/conjure', ft = { 'fnl' } },
      { 'cespare/vim-toml', ft = { 'toml' } },
      { 'stephpy/vim-yaml', ft = { 'yaml' } },
      { 'dag/vim-fish', ft = { 'fish' } },

      -- completions
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      { 'hrsh7th/nvim-cmp', requires = { 'onsails/lspkind-nvim' }, after = 'lspkind-nvim', config = [[require'config.nvim-cmp']] },
      { 'mtoohey31/cmp-fish', ft = 'fish' },

      -- lsp
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
    }

    -- snippets
    use {
      'SirVer/ultisnips',
      { 'honza/vim-snippets', after = 'ultisnips' },
      { 'quangnguyen30192/cmp-nvim-ultisnips', after = { 'nvim-cmp', 'ultisnips' } },
    }

    -- lazy-load colorscheme
    use {
      'dpjungmin/tissue.nvim',
      after = {
        'lightline.vim',
        'vim-illuminate',
      },
      config = function()
        vim.cmd 'colorscheme a'
      end,
    }
  end,
  config = {
    max_jobs = 16,
    compile_path = (require 'packer.util').join_paths(
      vim.fn.stdpath 'data',
      'site',
      'lua',
      'packer_compiled.lua'
    ),
    display = {
      open_fn = function()
        return (require 'packer.util').float { border = 'single' }
      end,
      prompt_border = 'single',
    },
    autoremove = true,
  },
}

if _G['install-packages'] then
  (require 'packer').sync()
  vim.notify 'Re-start Neovim after packages are installed'
  return
end

if not pcall(require, 'packer_compiled') then
  vim.notify 'Error requiring "packer_compiled.lua". Run PackerSync to fix!'
end
