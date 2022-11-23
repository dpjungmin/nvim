(local {: run} (require :libx))

(run {"features" [ "nvim-0.7.0" "python3" ]
      "executables" [ "git" "rg" "fd" "lazygit" ]
      "modules" [ "globals" "mappings" "options" "plugins" ]})
