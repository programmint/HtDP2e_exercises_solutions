; 18.1、题目
; 定义函数 string-join，读取两个字符串，字符串之间添加下划线 _ ，参考习题 2 获得思路。

; 18.2、实现
(define (string-join str1 str2)
  (string-append str1 "_" str2))

(string-join "Htdp" "2e") 

; 18.3、思路解析
; 这个题目简单，考察定义函数，以及运用 string-append 