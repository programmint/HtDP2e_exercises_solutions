; 2.1、题目
; 将 prefix 和 suffix 两个变量拼接起来（即拼串），并加上下划线"_"，最终的形成"hello_world"

; 2.2、实现
(define prefix "hello")
(define suffix "world")
(string-append prefix "_" suffix)

; 2.3、思路解析
; 这个题目很简单，思书上直接给出了思路，即运用：string-append，其实 append 这个函数 Python 也在运用;