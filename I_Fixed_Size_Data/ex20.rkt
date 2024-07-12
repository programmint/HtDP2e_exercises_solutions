; 20.1、题目
; 定义函数 string-delete，读入字符串 str 和数字 i ， 从字符串 str 中删除 i 位置的字符。i 的数值位于 0 和字符串长度之间。参考习题 4 获得灵感。string-delete 可以处理空字符串吗？

; 20.2、实现
; 题目里限制了 i 的数值范围，所以不必使用 cond 了。

(define (string_delete str i)
    (string-append(substring str 0 i)(substring str (+ i 1))))

(string_delete "htdp2e" 3)

; 其实从这里就看出来了，定义的 string_delete 函数，处理了不了空字符串。

; 20.3、思路解析
; 对比练习题 4 ，这个题目很简单，从习题 16 一直到 习题 20 ，都是前面的题目，转换一下形式，用函数来处理，所以可以推论，这几个题目是加深对函数的理解。
