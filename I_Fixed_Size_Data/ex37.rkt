; 37.1、题目
; 设计函数 string-rest，生成一个与给定字符串相同的字符串，但去掉第一个字符。

; 37.2、实现
    ; 37.2.1、String represents text . 信息转为数据

    ; 37.2.2、string -> string  函数签名

    ; 37.2.3、Removes the last character but keeps the others 目的声明

    ; 37.2.4、(define (string-rest str)) 函数头

    ; 37.2.5、 函数示例
    ; given: 
    ;   str 是 "How to design programs" 
    ; expected: 
    ;   "ow to design programs" 

    ; 37.2.6、(define (sting-rest str)  盘点（inventory）
    ;            (... str ...))

    (define (sting-rest str)  
            (substring str 1))

    (sting-rest "How to design programs") 

; 37.3、思路解析
; 对应的思路，也是写在注释里面了。
