; https://github.com/lewis6991/gitsigns.nvim

(import-macros {: map!} :macros)

(local gitsigns (require :gitsigns))

(gitsigns.setup {:signs {:add {:hl :GitSignsAdd
                               :text "▎"
                               :numhl :GitSignsAddNr
                               :linehl :GitSignsAddLn}
                         :change {:hl :GitSignsChange
                                  :text "▎"
                                  :numhl :GitSignsChangeNr
                                  :linehl :GitSignsChangeLn}
                         :delete {:hl :GitSignsDelete
                                  :text "_"
                                  :numhl :GitSignsDeleteNr
                                  :linehl :GitSignsDeleteLn}
                         :topdelete {:hl :GitSignsDelete
                                     :text "‾"
                                     :numhl :GitSignsDeleteNr
                                     :linehl :GitSignsDeleteLn}
                         :changedelete {:hl :GitSignsChange
                                        :text "▎"
                                        :numhl :GitSignsChangeNr
                                        :linehl :GitSignsChangeLn}
                         :untracked {:hl :GitSignsAdd
                                     :text "▎"
                                     :numhl :GitSignsAddNr
                                     :linehl :GitSignsAddLn}}
                 :signcolumn true
                 :numhl false
                 :linehl false
                 :word_diff false
                 :watch_gitdir {:interval 1000 :follow_files true}
                 :attach_to_untracked true
                 :current_line_blame false
                 :current_line_blame_opts {:virt_text true
                                           :virt_text_pos :eol
                                           :delay 500
                                           :ignore_whitespace false}
                 :current_line_blame_formatter "<author>, <author_time:%Y-%m-%d> - <summary>"
                 :sign_priority 6
                 :update_debounce 100
                 :status_formatter nil
                 :max_file_length 40000
                 :preview_config {:border :single
                                  :style :minimal
                                  :relative :cursor
                                  :row 0
                                  :col 1}
                 :yadm {:enable false}
                 :on_attach (fn [bufnr]
                              (local gs package.loaded.gitsigns)
                              (map! [n] "]c"
                                    (fn []
                                      (when vim.wo.diff
                                        (lua "return \"]c\""))
                                      (vim.schedule (fn []
                                                      (gs.next_hunk))
                                                    {:desc ""})
                                      :<Ignore>)
                                    {:expr true})
                              (map! [n] "[c"
                                    (fn []
                                      (when vim.wo.diff
                                        (lua "return \"[c\""))
                                      (vim.schedule (fn []
                                                      (gs.prev_hunk)))
                                      :<Ignore>)
                                    {:desc "" :expr true})
                              (map! [nv] :<leader>gs
                                    "<cmd>Gitsigns stage_hunk<cr>"
                                    {:desc "Stage the hunk at the cursor position"})
                              (map! [nv] :<leader>gr
                                    "<cmd>Gitsigns reset_hunk<cr>"
                                    {:desc "Reset the lines of the hunk at the cursor position"})
                              (map! [n] :<leader>gS gs.stage_buffer
                                    {:desc "Stage all hunks in current buffer"})
                              (map! [n] :<leader>gu gs.undo_stage_hunk
                                    {:desc "Undo the last stage_hunk()"})
                              (map! [n] :<leader>gR gs.reset_buffer
                                    {:desc "Reset the lines of all hunks in the buffer"})
                              (map! [n] :<space>p gs.preview_hunk
                                    {:desc "Preview the hunk at the cursor position"})
                              (map! [n] :<leader>gb
                                    (fn []
                                      (gs.blame_line {:full true}))
                                    {:desc "Run git blame on the current line"})
                              (map! [n] :<leader>gd gs.diffthis
                                    {:desc "Perform a vimdiff on the given file"})
                              (map! [n] :<space>tgb
                                    gs.toggle_current_line_blame
                                    {:desc "Toggle current-line git blame"})
                              (map! [n] :<space>tgd gs.toggle_deleted
                                    {:desc "Toggle git deleted"})
                              (map! [n] :<space>tgs gs.toggle_signs
                                    {:desc "Toggle git signs"})
                              (map! [ox] :ih ":<c-u>Gitsigns select_hunk<cr>"))})
