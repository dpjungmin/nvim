; https://github.com/j-hui/fidget.nvim

(local fidget (require :fidget))

(fidget.setup {:text {:spinner :dots_toggle
                      :done ""
                      :commenced :Loading
                      :completed :Completed}
               :align {:bottom true :right true}
               :timer {:spinner_rate 500 :fidget_decay 1500 :task_decay 1000}
               :window {:relative :editor :blend 0 :zindex nil :border :none}
               :fmt {:leftpad true
                     :stack_upwards true
                     :max_width 0
                     :fidget (fn [fidget-name spinner]
                               (string.format "%s %s" spinner fidget-name))
                     :task (fn [task-name message percentage]
                             (string.format "%s%s [%s]" message
                                            (or (and percentage
                                                     (string.format " (%s%%)"
                                                                    percentage))
                                                "")
                                            task-name))}
               :debug {:logging false :strict false}})
