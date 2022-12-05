; https://github.com/akinsho/toggleterm.nvim

(local toggleterm (require :toggleterm))

(toggleterm.setup {:shell (or (os.getenv :SHELL) :sh)
                   :open_mapping "<c-\\>"
                   :size (fn [term]
                           (if (= term.direction :horizontal) 25
                               (= term.direction :vertical) (* vim.o.columns
                                                               0.4)))
                   :shade_terminals true
                   :shading_factor 2
                   :hide_numbers true
                   :start_in_insert true
                   :close_on_exit true
                   :direction :float
                   :float_opts {:border :single :winblend 10}})
