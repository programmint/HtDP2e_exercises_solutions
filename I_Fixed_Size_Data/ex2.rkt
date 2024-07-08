;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;2.1、实现
(define prefix "hello")
(define suffix "world")
(string-append prefix "_" suffix)

;2.2、思路解析
;这个题目很简单,题目的思路,书上直接给出了,即运用：string-append,其实 append 这个函数 Python 也在运用;