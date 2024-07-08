;  1、String represents text . 信息转为数据

; 2、string -> string  函数签名

; 3、Remove the last character and keep the rest 目的声明

; 4、(define (string-remove-last str)) 函数头

; 8、 函数示例
; given: 
;   str 是 "How to design programs" 
; expected: 
;   "How to design program" 

; 8、(define (string-remove-last str)  盘点（inventory）
;            (... str ...))


(define (string-remove-last str)  
           (substring str 0 (- (string-length str) 1)))

(string-remove-last "How to design programs") 