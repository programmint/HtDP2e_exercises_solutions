
; 16.1、题目
; 定义函数 image-area，计算给定图片的像素数量，参考习题 6 获得思路。

; 16.2、实现
(define (image-area img)
  (* (image-height img) (image-width img)))
  
   (image-area img) ;插入对应的具体图片

; 16.3、思路解析
; 这个题目简单，考察之前的 image-height 和 image-width 
