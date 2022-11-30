; https://github.com/simrat39/rust-tools.nvim

(import-macros {: map!} :macros)

(local setup (. (require :rust-tools) :setup))

(setup {:tools {:executor (. (require :rust-tools.executors) :termopen)
                :on_initialized nil
                :reload_workspace_from_cargo_toml true
                :inlay_hints {:only_current_line false
                              :show_parameter_hints true
                              :show_variable_name false
                              :parameter_hints_prefix ""
                              :other_hints_prefix "-> "
                              :max_len_align false
                              :max_len_align_padding 1
                              :right_align false
                              :right_align_padding 7
                              :highlight :InlayHints}
                :hover_actions {:border :single
                                :max_width nil
                                :max_height nil
                                :auto_focus false}
                :crate_graph {:backend :x11
                              :output nil
                              :full true
                              :enabled_graphviz_backends [:bmp
                                                          :cgimage
                                                          :canon
                                                          :dot
                                                          :gv
                                                          :xdot
                                                          :xdot1.2
                                                          :xdot1.4
                                                          :eps
                                                          :exr
                                                          :fig
                                                          :gd
                                                          :gd2
                                                          :gif
                                                          :gtk
                                                          :ico
                                                          :cmap
                                                          :ismap
                                                          :imap
                                                          :cmapx
                                                          :imap_np
                                                          :cmapx_np
                                                          :jpg
                                                          :jpeg
                                                          :jpe
                                                          :jp2
                                                          :json
                                                          :json0
                                                          :dot_json
                                                          :xdot_json
                                                          :pdf
                                                          :pic
                                                          :pct
                                                          :pict
                                                          :plain
                                                          :plain-ext
                                                          :png
                                                          :pov
                                                          :ps
                                                          :ps2
                                                          :psd
                                                          :sgi
                                                          :svg
                                                          :svgz
                                                          :tga
                                                          :tiff
                                                          :tif
                                                          :tk
                                                          :vml
                                                          :vmlz
                                                          :wbmp
                                                          :webp
                                                          :xlib
                                                          :x11]}}
        :server {:standalone false
                 :on_attach (fn [_ bufnr]
                              (map! [n] :K
                                    (fn []
                                      ((. (. (require :rust-tools)
                                             :hover_actions)
                                          :hover_actions)))
                                    {:desc "Display symbol information at the cursor"})
                              (map! [n] :<space>oc
                                    (fn []
                                      ((. (. (require :rust-tools)
                                             :open_cargo_toml)
                                          :open_cargo_toml)))
                                    {:desc "Open Cargo.toml"})
                              (map! [n] :<space>rr
                                    (fn []
                                      ((. (. (require :rust-tools) :runnables)
                                          :runnables)))
                                    {:desc "Run a Rust runnable"})
                              (map! [n] :<space>M
                                    (fn []
                                      ((. (. (require :rust-tools)
                                             :expand_macro)
                                          :expand_macro)))
                                    {:desc "Expand macros recursively"}))}
        :dap {:adapter {:type :executable :command :lldb-vscode :name :rt_lldb}}})
