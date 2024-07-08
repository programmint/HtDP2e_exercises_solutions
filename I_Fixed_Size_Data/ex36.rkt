;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex36) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; 1、image represents the number of pixels in a given image . 信息转为数据

; 2、image -> number  函数签名

; 3、counts the number of pixels in a given image 目的声明,第 1 点和第 3 点语意有重复

; 4、(define (image-area img)) 函数头

; 注，这里的图片，可以直接插入一张图片，也可以生成一张图片，来使用
; 我这里采取插入某一副图片的方式

; 6、 函数示例
; given: 
;   image  是 (rectangle 20 40 "solid" "blue")
; expected: 
;   800

; 6、(define (sting-last str)  盘点（inventory）
;            (... img ...))


(define (image-area img)
  (* (image-height img) (image-width img)))

(image-area (rectangle 20 40 "solid" "blue"))
