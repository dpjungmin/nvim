; https://github.com/folke/which-key.nvim

(local wk (require :which-key))

(wk.setup {:plugins {:marks true
                     :registers true
                     :spelling {:enabled false :suggestions 20}
                     :presets {:operators true
                               :motions true
                               :text_objects true
                               :windows true
                               :nav true
                               :z true
                               :g true}}
           :operators {:gc :Comments}
           :key_labels {:<space> :SPC :<cr> :RET :<tab> :TAB}
           :icons {:breadcrumb "»" :separator "➜" :group "+"}
           :popup_mappings {:scroll_down :<c-d> :scroll_up :<c-u>}
           :window {:border :single
                    :position :bottom
                    :margin [1 0 1 0]
                    :padding [2 2 2 2]
                    :winblend 0}
           :layout {:height {:min 4 :max 25}
                    :width {:min 20 :max 50}
                    :spacing 2
                    :align :left}
           :ignore_missing false
           :hidden [:<silent> :<cmd> :<Cmd> :<CR> :<cr> :call :lua "^:" "^ "]
           :show_help true
           :triggers :auto
           :triggers_blacklist {:i [:j :k] :v [:j :k]}})

(wk.register {:<space> {:a {:name :add}
                        :c {:name :code}
                        :f {:name :file}
                        :o {:name :open}
                        :r {:name :run}
                        :t {:name :toggle
                            :g {:name :git}
                            :b {:name :bufferline}}}
              :<leader> {:f {:name :telescope} :g {:name :git}}})
