;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


;6.1、实现
(define cat (bitmap "images/cat.png")) ;bitmap 的用法参考别人
    (* (image-heightt cat)(image-width cat))


;6.2、思路解析
;注意审题，编写像素的计算式。

;我最开始是用函数来解决这个问题，考虑复杂了，这里就是使用一个简单的表达式来计算。
;题目的本意，就是助你掌握这个表达式。

;6.3、vscode的麻烦
;这个题目依旧是用 vsocde 来写，目前，vscode 中暂时怎么样插入图片，暂时不清楚
;如果是 DrRacket 来写，插入图片，可以正确运行，但代码上传到 github上看，则是一片乱码；