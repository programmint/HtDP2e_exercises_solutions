; 13.1、题目
; 定义 string-first 函数，它从非空字符串中提取第一个 1 String。

; 13.2、实现
(define (string-first str)
  (substring str 0 1))
  
(string-first "abc")

; 13.3、思路
; 注意题目要求，是非空字符串。
; 我最开始的解题方法，是用 cond 加以判断，输入的字符串是不是非空，如果是，则给出对应的提示，看似严谨，实则审题不严，题目中已经有了要求，要的是非空字符串。
; 这个题目是很简单的题目。
; 这里主要是用到了 substring