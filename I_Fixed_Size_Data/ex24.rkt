
; 24.1、题目
; 现在定义了函数==>，使用步进器判断 (==> #true #false) 的值。

; 24.2、实现
(define (==> x y)
  (or (not x) y))

(==> #true #false)
==；(or (not #true) #false)
==；(or #false #false)
==
#false

; 24.3、思路解析
; 定义==>这个函数，我本地总是运行不了，这次也不例外。
