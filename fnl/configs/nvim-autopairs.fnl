; https://github.com/windwp/nvim-autopairs

(local ap (require :nvim-autopairs))
(ap.setup {})

(local cmp-autopairs (require :nvim-autopairs.completion.cmp))
(local cmp (require :cmp))

(cmp.event:on :confirm_done
              (cmp-autopairs.on_confirm_done {:map_char {:tex ""}}))
