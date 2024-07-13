; 35.1、题目
; 设计函数string-last，它从非空字符串中提取最后一个字符。

; 35.2、实现
    ; 35.2.1、String represents text. 信息转为数据

    ; 35.2.2、string -> 1string  函数签名

    ; 35.2.3、extracts the last character from a non-empty string 目的声明

    ; 35.2.4、(define (sting-last str)) 函数头

    ; 35.2.5、 函数示例
    ; given: 
    ;   str 是 "How to design programs" 
    ; expected: 
    ;   "s"

    ; 35.2.6、(define (sting-last str)  盘点（inventory）
    ;            (... str ...))


    (define (string-last str)
        (substring str (- (string-length str) 1)))

    (string-last "How to design programs")

; 35.3、思路解析
; 对应的思路，还是写在注释里面了。