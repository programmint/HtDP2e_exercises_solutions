; 38.1、题目
; 设计函数 string-remove-last，该函数用于生成一个与给定字符串类似的字符串，但去掉了最后一个字符。

; 38.2、实现
    ; 38.2.1、String represents text . 信息转为数据

    ; 38.2.2、string -> string  函数签名

    ; 38.2.3、Remove the last character and keep the rest 目的声明

    ; 38.2.4、(define (string-remove-last str)) 函数头

    ; 38.2.5、 函数示例
    ; given: 
    ;   str 是 "How to design programs" 
    ; expected: 
    ;   "How to design program" 

    ; 38.2.6、(define (string-remove-last str)  盘点（inventory）
    ;            (... str ...))


    (define (string-remove-last str)  
            (substring str 0 (- (string-length str) 1)))

    (string-remove-last "How to design programs") 

; 38.3、思路解析
; 对应的思路，也是写在注释里面了。
