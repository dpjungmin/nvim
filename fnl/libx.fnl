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
          (vim.cmd :finish)))))
  (vim.cmd "packadd packer.nvim"))

(fn resume-last-cursor-pos []
  (vim.cmd "
    let ok = v:true

    if line(\"'\\\"\") > 1 && line(\"'\\\"\") <= line('$') && &ft !~# 'commit'
      let args = v:argv  \" command line arguments

      for arg in args
        if match(arg, '\\v^\\+(\\d){1,}$') != -1
          ok = false
          break
        endif
      endfor

      if ok
        execute \"normal! g`\\\"zvzz\"
      endif
    endif"))

(fn indent-blankline-toggle []
  (if vim.g._indent_blankline
    (set vim.g._indent_blankline false)
    (set vim.g._indent_blankline true))
  (vim.cmd :IndentBlanklineToggle))

(fn indent-blankline-activate []
  (when (not vim.g._indent_blankline)
    (lua "return"))
  (each [_ ft (ipairs vim.g.indent_blankline_filetype_exclude)]
    (when (= ft vim.bo.filetype)
      (lua "return")))
  (vim.cmd :IndentBlanklineEnable))

{: is-ready?
 : load-packer
 : resume-last-cursor-pos
 : indent-blankline-toggle
 : indent-blankline-activate}
