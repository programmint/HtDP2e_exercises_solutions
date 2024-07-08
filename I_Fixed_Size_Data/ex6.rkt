;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


;6.1、实现

(define cat (bitmap "images/cat.png")) 

(* (image-heightt cat)(image-width cat))

;6.2、思路解析
;注意审题,编写像素的计算式。

;我最开始是用函数来解决这个问题,很明显是考虑复杂了
;不过这个题目,确实有一定的迷惑性,这里主要的目的,是写出对应的表达式
;你当然可以写出一个函数,但题目的本意,就是助你掌握这个表达式。
;毕竟,程序是为了解决需求。