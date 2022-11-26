; https://github.com/wbthomason/packer.nvim

(fn startup [use]
  ; It is recommened to put `impatient.nvim` before any other plugins
  (use [{1 :lewis6991/impatient.nvim :config "require('impatient')"}
        [:wbthomason/packer.nvim]])

  (use [:nvim-lua/popup.nvim
        :nvim-lua/plenary.nvim
        :kyazdani42/nvim-web-devicons])

  ; Use default configuration
  (use [:andymass/vim-matchup
        {1 :machakann/vim-swap :event :VimEnter}
        {1 :machakann/vim-sandwich :event :VimEnter}
        {1 :itchyny/vim-highlighturl :event :VimEnter}
        {1 :windwp/nvim-ts-autotag :event :InsertEnter}
        {1 :tpope/vim-commentary :event :VimEnter}
        {1 :norcalli/nvim-colorizer.lua :event :VimEnter :config "require('colorizer').setup()"}])

  ; Configuration set in `global.lua`
  (use [:mhinz/vim-startify
        :jdhao/better-escape.vim
        :simnalamburt/vim-mundo
        {1 :preservim/vim-markdown :ft [:markdown]}
        {1 :jdhao/whitespace.nvim :event :VimEnter}
        {1 :iamcco/markdown-preview.nvim :run (fn [] ((. vim.fn "mkdp#util#install"))) :ft [:markdown]}])

  ; Use custom configuration
  (use [{1 :karb94/neoscroll.nvim :config "require('config.neoscroll')"}
        {1 :sbdchd/neoformat :config "require('config.neoformat')"}
        {1 :folke/which-key.nvim :event :VimEnter :config "require('config.which-key')"}
        {1 :itchyny/lightline.vim :config "require('config.lightline')"}
        {1 :tyru/open-browser.vim :event :VimEnter :config "require('config.open-browser')"}
        {1 :windwp/nvim-autopairs :event :InsertEnter :config "require('config.nvim-autopairs')"}
        {1 :akinsho/toggleterm.nvim :event :VimEnter :config "require('config.toggleterm')"}
        {1 :gelguy/wilder.nvim :requires [:romgrk/fzy-lua-native] :config "require('config.wilder')"}
        {1 :lukas-reineke/indent-blankline.nvim :event :VimEnter :config "require('config.indent-blankline')"}
        {1 :nvim-treesitter/nvim-treesitter :event :BufEnter :run ":TSUpdate" :config "require('config.nvim-treesitter')"}
        {1 :nvim-treesitter/playground :requires [:nvim-treesitter/nvim-treesitter :nvim-treesitter/nvim-treesitter-context] :after :nvim-treesitter}
        {1 :akinsho/bufferline.nvim :tag :v3.* :requires [:kyazdani42/nvim-web-devicons] :event :VimEnter}
        {1 :kyazdani42/nvim-tree.lua :requires [:kyazdani42/nvim-web-devicons] :tag :nightly :config "require('config.nvim-tree')"}
        {1 :nvim-telescope/telescope.nvim :tag :0.1.0 :requires [:nvim-lua/plenary.nvim] :config "require('config.telescope')"}
        {1 :kevinhwang91/nvim-bqf :ft :qf :config "require('config.nvim-bqf')"}
        {1 :phaazon/hop.nvim :branch :v1 :event :VimEnter :config (fn [] (vim.defer_fn (fn [] (require :config.hop)) 2000))}])

  ; Git
  (use [:tpope/vim-fugitive
        {1 :lewis6991/gitsigns.nvim :config "require('config.gitsigns')"}
        {1 :rbong/vim-flog :requires [:tpope/vim-fugitive]}])

  ; Language suppor
  (use [; Auto-completion
        :hrsh7th/cmp-nvim-lua
        :hrsh7th/cmp-buffer
        :hrsh7th/cmp-path
        :hrsh7th/cmp-cmdline
        {1 :hrsh7th/nvim-cmp :requires [:onsails/lspkind-nvim] :after :lspkind-nvim :config "require('config.nvim-cmp')"}
        {1 :mtoohey31/cmp-fish :ft :fish}
        ; Snippets
        :SirVer/ultisnips
        {1 :honza/vim-snippets :after :ultisnips}
        {1 :quangnguyen30192/cmp-nvim-ultisnips :after [:nvim-cmp :ultisnips]}
        ; Language enhancements
        {1 :simrat39/symbols-outline.nvim :config "require('config.symbols-outline')"}
        {1 :saecki/crates.nvim :tag :v0.2.1 :requires [:nvim-lua/plenary.nvim] :config "require('config.crates')"}
        {1 :cespare/vim-toml :ft [:toml]}
        {1 :stephpy/vim-yaml :ft [:yaml]}
        {1 :Olical/conjure :ft [:fnl]}
        :Olical/aniseed
        {1 :neovim/nvim-lspconfig :tag :v0.1.3
          :requires [:williamboman/nvim-lsp-installer
                    :hrsh7th/cmp-nvim-lsp
                    :simrat39/rust-tools.nvim
                    :p00f/clangd_extensions.nvim
                    :nvim-lua/plenary.nvim
                    :mfussenegger/nvim-dap]
          :after :nvim-cmp
          :config "require('config.lsp')"}
        {1 :j-hui/fidget.nvim :config "require('config.fidget')"}])

  ; Load theme
  (use {
    1 (.. (vim.fn.stdpath :config) :/lua/theme)
    :after [:bufferline.nvim]
    :config (fn [] (require :theme))}))

((. (require :packer) :startup) {
  1 (fn [use] (startup use))
  :config {:max_jobs 16
           :compile_path ((. (require :packer.util) :join_paths) (vim.fn.stdpath :data) :site :lua :packer_compiled.lua)
           :display {:open_fn (fn [] ((. (require :packer.util) :float) {:border :single}))}}})

(when (not (pcall require :packer_compiled))
  (vim.notify "Error requiring \"packer_compiled.lua\". Run PackerSync to fix!"))
