; 22.1、题目
; 在这个程序片段上使用DrRacket的步进器: （步进器）的解释符合你的直觉吗?

; 22.2、实现
(define (distance-to-origin x y)
  (sqrt (+ (sqr x) (sqr y))))
  
(distance-to-origin 3 4)
==； (sqrt (+ (* 3 3) (sqr y)))
==； (sqrt (+ 9 (sqr y)))
==； (sqrt (+ 9 (* 4 4)))
==； (sqrt (+ 9 16))
==； (sqrt 25)
==
5

; 22.3、思路解析
; 该题目也是比较简单，我个人感觉还是蛮符合直觉的