(fn nil? [x]
  (= nil x))

(fn str? [x]
  (= :string (type x)))

(fn tbl? [x]
  (= :table (type x)))

(fn fn? [x]
  (= :function (type x)))

(lambda set! [key ?value]
  "Set a vim option"
  (let [key (tostring key)]
    (let [value (if (nil? ?value) true ?value)]
      (match (key:sub -1)
        "+" `(doto (. vim.opt ,(key:sub 1 -2)) (: :append ,value))
        "-" `(doto (. vim.opt ,(key:sub 1 -2)) (: :remove ,value))
        _ `(tset vim.opt ,key ,value)))))

(lambda map! [[modes] lhs rhs ?opts]
  "Map a key binding"
  (assert-compile (sym? modes) "`modes` must be a symbol" modes)
  (assert-compile (or (str? lhs) (tbl? lhs)) "`lhs` must be a string or table"
                  lhs)
  (assert-compile (or (str? rhs) (tbl? rhs) (fn? rhs))
                  "`rhs` must be a string, table, or function" rhs)
  (assert-compile (or (nil? ?opts) (tbl? ?opts)) "`opts` must be a table" ?opts)
  (var o {:noremap true :silent true})
  (if (not= nil ?opts)
      (each [k v (pairs ?opts)]
        (tset o k v)))
  (let [modes (icollect [ch (string.gmatch (tostring modes) ".")]
                ch)]
    `(vim.keymap.set ,modes ,lhs ,rhs ,o)))

{: set! : map!}
