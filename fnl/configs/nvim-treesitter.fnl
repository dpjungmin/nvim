; https://github.com/nvim-treesitter/nvim-treesitter

(local p (require :nvim-treesitter.configs))

(p.setup {:ensure_installed [:vim
                             :lua
                             :make
                             :ninja
                             :c
                             :cpp
                             :cmake
                             :rust
                             :python
                             :fish
                             :go
                             :html
                             :javascript
                             :typescript
                             :json
                             :llvm
                             :toml
                             :yaml
                             :query
                             :html
                             :css
                             :scss
                             :nix]
          :sync_install false
          :ignore_install {}
          :highlight {:enable true
                      :disable {}
                      :additional_vim_regex_highlighting false}
          :autotag {:enable true}
          :playground {:enable true
                       :disable {}
                       :updatetime 25
                       :persist_queries false
                       :keybindings {:toggle_query_editor :o
                                     :toggle_hl_groups :i
                                     :toggle_injected_languages :t
                                     :toggle_anonymous_nodes :a
                                     :toggle_language_display :I
                                     :focus_language :f
                                     :unfocus_language :F
                                     :update :R
                                     :goto_node :<cr>
                                     :show_help "?"}}})
