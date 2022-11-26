(each [_ m (ipairs ["auto-cmds" "globals" "mappings" "options" "plugins"])]
  (require (.. "mods." m)))
