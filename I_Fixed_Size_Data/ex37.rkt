;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex37) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; 1、String represents text . 信息转为数据

; 2、string -> string  函数签名

; 3、Removes the last character but keeps the others 目的声明

; 4、(define (string-rest str)) 函数头

; 7、 函数示例
; given: 
;   str 是 "How to design programs" 
; expected: 
;   "ow to design programs" 

; 7、(define (sting-rest str)  盘点（inventory）
;            (... str ...))


(define (sting-rest str)  
           (substring str 1))

(sting-rest "How to design programs") 