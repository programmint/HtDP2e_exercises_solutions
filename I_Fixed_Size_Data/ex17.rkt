; 17.1、题目
; 定义函数 image-classfiy，读取对应图片，如果高度大于宽度，返回 tall ，如果宽度大于高度，返回 wide ， 如果宽度与高度相等，则返回 square，参考习题 8 获得思路。

; 17.2、实现
(define (image-classify img)  
  (cond
    [(>= (image-height img) (image-width img)) "tall"]
    [(= (image-height img) (image-width img)) "square"]
    [(<= (image-height img) (image-width img)) "wide"]))

(image-classify img) 
;用 img 来代替实际中的图片

; 17.3、思路解析
; 这个题目也不难，还是考察 image-height 和 image-width，以及运用 cond  