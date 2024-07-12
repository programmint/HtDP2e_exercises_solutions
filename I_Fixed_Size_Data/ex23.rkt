
; 23.1、题目
; "hello world"中的第一个字符串是"h"。下面的函数是如何计算这个结果的？使用步进器来确认你的想法。

; 23.2、实现
(define s "hello_world")

(define (string-first s)
  (substring s 0 1))

(string-first s 0 1)
==；(string-first "hello_world" 0 1)
==
"h"

; 23.3、思路解析
; 这个题目的函数，正是提取字符串的第1个字母，所以是:"h"