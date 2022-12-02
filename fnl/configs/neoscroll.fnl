; https://github.com/karb94/neoscroll.nvim

(local neoscroll (require :neoscroll))

(neoscroll.setup {:hide_cursor true
                  :stop_eof true
                  :use_local_scrolloff false
                  :respect_scrolloff false
                  :cursor_scrolls_alone true
                  :easing_function :quadratic
                  :pre_hook nil
                  :post_hook nil
                  :performance_mode false})

(local t {})
(tset t :<c-u> [:scroll [:-vim.wo.scroll :true :20 "'cubic'"]])
(tset t :<c-d> [:scroll [:vim.wo.scroll :true :20 "'cubic'"]])
(tset t :<s-b>
      [:scroll ["-vim.api.nvim_win_get_height(0)" :true :50 "'cubic'"]])

(tset t :<s-f> [:scroll ["vim.api.nvim_win_get_height(0)" :true :50 "'cubic'"]])
(tset t :<s-y> [:scroll [:-0.10 :false :100 nil]])
(tset t :<s-e> [:scroll [:0.10 :false :100 nil]])
(tset t :zt [:zt [:10]])
(tset t :zz [:zz [:10]])
(tset t :zb [:zb [:10]])

(local config (require :neoscroll.config))

(config.set_mappings t)
