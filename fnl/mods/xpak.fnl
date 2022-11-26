(import-macros {: set! : hl!} :macros)

(set! syntax :ON)
(set! termguicolors)
(set! background :dark)

; Styles:
;   bold
;   underline
;   underlineline   double underline
;   undercurl       curly underline
;   underdot        dotted underline
;   underdash       dashed underline
;   strikethrough
;   reverse
;   inverse         same as reverse
;   italic
;   standout
;   nocombine       override attributes instead of combining them
;   NONE            no attributes used (used to reset it)
(local s {"comment" []
          "constant" []
          "string" []
          "number" []
          "func" []
          "conditional" []
          "macro" []
          "context" ["bold"]})

; Palette
(local p {; Base16
          :base00  :#2d302f ; Default Background
          :base01  :#434846 ; Lighter Background (Used for status bars, line number and folding marks)
          :base02  :#5a605d ; Selection Background
          :base03  :#9da8a3 ; Comments, Invisibles, Line Highlighting
          :base04  :#cad8d2 ; Dark Foreground (Used for status bars)
          :base05  :#e0f0ef ; Default Foreground, Caret, Delimiters, Operators
          :base06  :#ecf6f2 ; Light Foreground (Not often used)
          :base07  :#fcfefd ; Light Background (Not often used)
          :base08  :#f9906f ; Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
          :base09  :#b38a61 ; Integers, Boolean, Constants, XML Attributes, Markup Link Url
          :base0A  :#f0c239 ; Classes, Markup Bold, Search Text Background
          :base0B  :#8ab361 ; Strings, Inherited Class, Markup Code, Diff Inserted
          :base0C  :#30dff3 ; Support, Regular Expressions, Escape Characters, Markup Quotes
          :base0D  :#b0a4e3 ; Functions, Methods, Attribute IDs, Headings
          :base0E  :#cca4e3 ; Keywords, Storage, Selector, Markup Italic, Diff Changed
          :base0F  :#ca6924 ; Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
          :black   :#2d302f
          :white   :#e0f0eF
          ; Gray
          :gray0   :#cdd9e5
          :gray1   :#adbac7
          :gray2   :#909dab
          :gray3   :#768390
          :gray4   :#636e7b
          :gray5   :#545d68
          :gray6   :#444c56
          :gray7   :#373e47
          :gray8   :#2d333b
          :gray9   :#22272e
          ; Blue
          :blue0   :#c6e6ff
          :blue1   :#96d0ff
          :blue2   :#6cb6ff
          :blue3   :#539bf5
          :blue4   :#4184e4
          :blue5   :#316dca
          :blue6   :#255ab2
          :blue7   :#1b4b91
          :blue8   :#143d79
          :blue9   :#0f2d5c
          ; Green
          :green0  :#b4f1b4
          :green1  :#8ddb8c
          :green2  :#6bc46d
          :green3  :#57ab5a
          :green4  :#46954a
          :green5  :#347d39
          :green6  :#2b6a30
          :green7  :#245829
          :green8  :#1b4721
          :green9  :#113417
          ; Teal
          :teal0   :#f7ffff
          :teal1   :#dcfffd
          :teal2   :#ccfffc
          :teal3   :#a6fffa
          :teal4   :#73fff7
          :teal5   :#05f7f4
          :teal6   :#2de3da
          :teal7   :#00bdb6
          :teal8   :#10a39e
          :teal9   :#008577
          ; Yellow
          :yellow0 :#fbe090
          :yellow1 :#eac55f
          :yellow2 :#daaa3f
          :yellow3 :#c69026
          :yellow4 :#ae7c14
          :yellow5 :#966600
          :yellow6 :#805400
          :yellow7 :#6c4400
          :yellow8 :#593600
          :yellow9 :#452700
          ; Orange
          :orange0 :#ffddb0
          :orange1 :#ffbc6f
          :orange2 :#f69d50
          :orange3 :#e0823d
          :orange4 :#cc6b2c
          :orange5 :#ae5622
          :orange6 :#94471b
          :orange7 :#7f3913
          :orange8 :#682d0f
          :orange9 :#4d210c
          ; Red
          :red0    :#ffd8d3
          :red1    :#ffb8b0
          :red2    :#ff938a
          :red3    :#f47067
          :red4    :#e5534b
          :red5    :#c93c37
          :red6    :#ad2e2c
          :red7    :#922323
          :red8    :#78191b
          :red9    :#5d0f12
          ; Purple
          :purple0 :#eedcff
          :purple1 :#dcbdfb
          :purple2 :#dcbdfb
          :purple3 :#b083f0
          :purple4 :#986ee2
          :purple5 :#8256d0
          :purple6 :#6b44bc
          :purple7 :#5936a2
          :purple8 :#472c82
          :purple9 :#352160
          ; Pink
          :pink0   :#ffd7eb
          :pink1   :#ffb3d8
          :pink2   :#fc8dc7
          :pink3   :#e275ad
          :pink4   :#c96198
          :pink5   :#ae4c82
          :pink6   :#983b6e
          :pink7   :#7e325a
          :pink8   :#69264a
          :pink9   :#551639
          ; Coral
          :coral0  :#ffdacf
          :coral1  :#ffb9a5
          :coral2  :#f79981
          :coral3  :#ec775c
          :coral4  :#de5b41
          :coral5  :#c2442d
          :coral6  :#a93524
          :coral7  :#8d291b
          :coral8  :#771d13
          :coral9  :#5d1008})

; Colors
(local c {:error_foreground p.red4
          :warning_foreground p.yellow3
          :info_foreground p.blue3
          :hint_foreground p.gray3
          :none :None
          :yank :#2ecc71
          ; Syntax
          :syntax {:comment p.base03
                   :number p.base09
                   :constant p.base09
                   :func p.base0D
                   :character p.base0B
                   :string p.base0B
                   :identifier p.base04
                   :keyword p.base0E
                   :storage p.base0E
                   :tag p.base04
                   :debug p.base04
                   :delimiter p.base06
                   :operator p.base05
                   :type p.base0A
                   :todo p.base0D
                   :include p.base0C
                   :exception p.base0C
                   :preprocessor p.base04
                   :macro p.base0A}
          ; Editor
          :editor {:background p.base00
                   :bracket_match_background p.base01
                   :bufferline {:active_border p.coral3
                                :foreground p.gray5
                                :active_foreground p.gray1}
                   :colorcolumn p.base01
                   :cursor {:background :#00ff00
                            :active_background :#ff0000}
                   :diff {:inserted_line_background p.green7
                          :inserted_text_background p.green5
                          :removed_line_background p.red7
                          :removed_text_background p.red5
                          :old_file p.coral5
                          :new_file p.green5
                          :file p.blue5}
                   :find_match {:background p.base0A
                                :current p.base0A}
                   :fold_background p.base01
                   :foreground p.base05
                   :git {:added_resource_foreground p.green4
                         :modified_resource_foreground p.yellow4
                         :deleted_resource_foreground p.red4
                         :untracked_resource_foreground p.green4
                         :ignored_resource_foreground p.gray5
                         :conflicting_resource_foreground p.orange4
                         :submodule_resource_foreground p.gray3
                         :blame_text_foreground p.gray5}
                   :indent_guide {:background p.base01
                                  :active_background p.base01}
                   :line_highlight_background p.gray7
                   :line_number {:foreground p.gray4
                                 :active_foreground p.gray1}
                   :popup {:foreground p.base06
                           :background p.base01
                           :highlight_blue :#404b82
                           :highlight_gray p.base02}
                   :selection p.base01
                   :split_border p.gray6
                   :title_foreground p.blue2
                   :whitespace p.base01}})

; (each [k v (pairs p)]
;   (do
;     (assert (= nil (. c k)))
;     (tset c k v)))

; Plugins
; https://github.com/j-hui/fidget.nvim
(hl! FidgetTask {:fg c.syntax.comment :bg c.none})
(hl! FidgetTitle {:fg p.base0E :bg c.none :style :bold})