(local {: is-ready? : load-packer} (require :libx))

(fn main [feats execs]
  (if (not (is-ready? feats execs))
    (vim.cmd :finish))
  (load-packer)
  (require :mods))

(main ["nvim-0.7.0" "python3"] ["git" "rg" "fd" "lazygit"])
