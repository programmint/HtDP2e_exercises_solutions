
; 25.1、题目
; 看看第 17 题的一个可能的解，通过步进器看看是否可以修正一下

; 25.2、实现
; 我放入了一正方形图片，但运行的结果却是 tall

; 25.3、思路解析
; 我明明放入的是一个正方形图片，怎么得出来的结果却是 tall，肯定是有问题。

; github上有人这样子调节：
(define (image-classify img)
  (cond
    [(= (image-height img) (image-width img)) "square"]
    [(>= (image-height img) (image-width img)) "tall"]
    [(<= (image-height img) (image-width img)) "wide"]))

; 确实是避开了这个问题，代码的顺序看来能影响最终的结果。

; 不过，我在这里进一步修改了一下：
(define (image-classify img)
  (cond
    [(= (image-height img) (image-width img)) "square"]
    [(> (image-height img) (image-width img)) "tall"]  ;去掉了 = 
    [(< (image-height img) (image-width img)) "wide"])) ;去掉了 = 

 (image-classify img) ;插入对应的图片，试了一下，这样子，逻辑上更严谨一些。
