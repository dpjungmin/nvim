(require :plugins)

(each [_ m (ipairs ["auto-cmds" "globals" "mappings" "options" "xpak"])]
  (require (.. "mods." m)))
