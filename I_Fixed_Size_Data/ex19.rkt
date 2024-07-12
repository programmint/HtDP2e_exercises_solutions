; 19.1、题目
; 定义函数 string-insert，读取字符串str 和 数值 i ，添加下划线，位于 str 的 i 处，假设 i 的值是位于 0 和字符串的长度之间，参考习题 3 获得思路。

; 19.2、实现
(define (string-insert str i)
  (string-append
   (substring str 0 i)
   "_"
   (substring str i)))

(string-insert "Htdp2e" 4)

; 19.3、思路解析
; 这个题目为了添加一个下划线，首先是把对应位置的元素提取出来，然后再组合起来，稍显小麻烦，看看后面有没有更简单的解决方法。