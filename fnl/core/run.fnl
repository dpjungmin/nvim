(local autocmds (require :lib.autocmds))

(fn P [x]
  (print
    (vim.inspect x)))

(fn is-ready? [feats execs]
  (var ok true)
  (each [_  f (ipairs feats)]
    (if (not= 1 (vim.fn.has f))
      (vim.notify (.. "Feature " f " is required, but is missing!")
        (set ok false))))
  (each [_  e (ipairs execs)]
    (if (not= 1 (vim.fn.executable e))
      (vim.notify (.. "Executable " e " is required, but is missing!")
        (set ok false))))
  ok)

(fn load-packer []
  (let [repo "https://github.com/wbthomason/packer.nvim"]
    (let [path (.. (vim.fn.stdpath "data") "/site/pack/packer/start/packer.nvim")]
      (if (= 1 (vim.fn.empty (vim.fn.glob path)))
        (let [cmd (string.format "20split |term git clone --depth=1 %s %s" repo path)]
          (vim.cmd (.. cmd " && echo Re-start Neovim and run \"PackerSync\""))
          (vim.cmd "finish")))))
  (vim.cmd "packadd packer.nvim"))

(fn load-modules [mods]
  (each [_ m (ipairs mods)]
    (require m)))

(fn run [config]
  (if (not (is-ready? config.features config.executables))
    (vim.cmd "finish"))
  (load-packer)
  (autocmds.load)
  (load-modules config.modules))

{: run}
