(import-macros {: map!} :macros)

; https://github.com/williamboman/mason.nvim
((. (require :mason) :setup) {:ui {:icons {:server_installed "✓"
                                           :server_pending "➜"
                                           :server_uninstalled "✗"}}})

; https://github.com/williamboman/mason-lspconfig.nvim
((. (require :mason-lspconfig) :setup) {:automatic_installation false})

; Define sign name
(vim.fn.sign_define :DiagnosticSignError
                    {:text :E :texthl :DiagnosticSignError})

(vim.fn.sign_define :DiagnosticSignWarn {:text :W :texthl :DiagnosticSignWarn})
(vim.fn.sign_define :DiagnosticSignInformation
                    {:text :I :texthl :DiagnosticSignInformation})

(vim.fn.sign_define :DiagnosticSignHint {:text :H :texthl :DiagnosticSignHint})

; Configure diagnostic options globally
(vim.diagnostic.config {:underline false
                        :virtual_text {:spacing 0 :prefix ""}
                        :signs true
                        :float {:wrap true
                                :pad_top 0
                                :pad_bottom 0
                                :focusable true
                                :style :minimal
                                :border :single
                                :source :always
                                :header ""
                                :prefix ""
                                :format (fn [diagnostic]
                                          (local severity diagnostic.severity)
                                          (var message diagnostic.message)
                                          (if (= severity
                                                 vim.diagnostic.severity.ERROR)
                                              (set message (.. "[E] " message))
                                              (= severity
                                                 vim.diagnostic.severity.WARN)
                                              (set message (.. "[W] " message))
                                              (= severity
                                                 vim.diagnostic.severity.INFO)
                                              (set message (.. "[I] " message))
                                              (= severity
                                                 vim.diagnostic.severity.HINT)
                                              (set message (.. "[H] " message)))
                                          message)}
                        :update_in_insert false
                        :severity_sort true})

(tset vim.lsp.handlers :textDocument/hover
      (vim.lsp.with vim.lsp.handlers.hover {:focusable false :border :single}))

(tset vim.lsp.handlers :textDocument/signatureHelp
      (vim.lsp.with vim.lsp.handlers.signature_help
                    {:focusable false :border :single}))

; Language servers
; https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
(local language-servers
       {:bashls {:cmd [:bash-language-server :start]
                 :filetypes [:sh]
                 :single_file_support true}
        :vimls {:cmd [:vim-language-server :--stdio]
                :filetypes [:vim]
                :init_options {:diagnostic {:enable true}
                               :indexes {:count 3
                                         :gap 100
                                         :projectRootPatterns [:runtime
                                                               :nvim
                                                               :.git
                                                               :autoload
                                                               :plugin]
                                         :runtimepath true}
                               :isNeovim true
                               :iskeyword "@,48-57,_,192-255,-#"
                               :runtimepath ""
                               :suggest {:fromRuntimepath true
                                         :fromVimruntime true}
                               :vimruntime ""}
                :single_file_support true
                :flags {:debounce_text_changes 500}}
        :sumneko_lua {:filetypes [:lua]
                      :log_level 2
                      :settings {:Lua {:runtime {:version :LuaJIT}
                                       :diagnostics {:globals [:vim]}
                                       :workspace {:library (vim.api.nvim_get_runtime_file ""
                                                                                           true)}
                                       :telemetry {:enable false}}}
                      :single_file_support true}
        :pyright {:cmd [:pyright-langserver :--stdio]
                  :filetypes [:python]
                  :settings {:python {:analysis {:autoSearchPaths true
                                                 :diagnosticMode :workspace
                                                 :useLibraryCodeForTypes true}}}}
        :cmake {:cmd [:cmake-language-server]
                :filetypes [:cmake]
                :init_options {:buildDirectory :build}}
        :tsserver {:cmd [:typescript-language-server :--stdio]
                   :filetypes [:javascript
                               :javascriptreact
                               :javascript.jsx
                               :typescript
                               :typescriptreact
                               :typescript.tsx]
                   :init_options [:hostInfo :neovim]
                   :root_dir ((. (require :lspconfig.util) :root_pattern) :package.json
                                                                          :tsconfig.json
                                                                          :jsconfig.json
                                                                          :.git)}
        :clangd (fn []
                  (require :lsp.clang))
        :rust_analyzer (fn []
                         (require :lsp.rust))})

; https://github.com/neovim/nvim-lspconfig
(local lspconfig (require :lspconfig))
(fn on-attach [client bufnr]
  (map! [n] :K vim.lsp.buf.hover
        {:desc "Displays hover information about the symbol under the cursor"})
  (map! [n] :<m-k> vim.lsp.buf.signature_help
        {:desc "Displays signature information about the symbol under the cursor"})
  (map! [n] :<space>cd vim.lsp.buf.definition
        {:desc "Jumps to the definition of the symbol under the cursor"})
  (map! [n] :<space>cD vim.lsp.buf.declaration
        {:desc "Jumps to the declaration of the symbol under the cursor"})
  (map! [n] :<space>ca vim.lsp.buf.code_action
        {:desc "Selects a code action available at the current cursor position"})
  (map! [n] :<space>ctd vim.lsp.buf.type_definition
        {:desc "Jumps to the definition of the type of the symbol under the cursor"})
  (map! [n] :<space>crn vim.lsp.buf.rename
        {:desc "Renames all references of the symbol under the cursor"})
  (map! [n] :<space>clr vim.lsp.buf.references
        {:desc "Lists all the references to the symbol under the cursor in the quickfix window"})
  (map! [n] :<space>wa vim.lsp.buf.add_workspace_folder
        {:desc "Add the folder at path to the workspace folders"})
  (map! [n] :<space>wr vim.lsp.buf.remove_workspace_folder
        {:desc "Remove the folder at path from the workspace folders"})
  (map! [n] :<space>wl
        (fn []
          (vim.notify (vim.inspect (vim.lsp.buf.list_workspace_folders))
                      vim.log.levels.INFO
                      {:render :default :title "Workspace folders"}))
        {:desc "List workspace folders"}))

(each [s o (pairs language-servers)]
  (var opts {:capabilities ((. (require :cmp_nvim_lsp) :default_capabilities) (vim.lsp.protocol.make_client_capabilities))
             :flags {:debounce_text_changes 150}
             :on_attach on-attach})
  (if (= :function (type o))
      (o)
      (do
        (each [k v (pairs o)]
          (tset opts k v))
        ((. (. lspconfig s) :setup) opts))))
