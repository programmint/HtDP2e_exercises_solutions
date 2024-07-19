
; 36.1、题目
; 设计函数 image-area，计算给定图片的像素数量。


; 36.2、实现
  ; 36.2.1、image represents the number of pixels in a given image . 信息转为数据

  ; 36.2.2、image -> number  函数签名

  ; 36.2.3、counts the number of pixels in a given image 目的声明,第 1 点和第 3 点语意有重复

  ; 36.2.4、(define (image-area img)) 函数头

  ; 注，这里的图片，可以直接插入一张图片，也可以生成一张图片，来使用
  ; 我这里采取插入某一副图片的方式

  ; 36.2.5、 函数示例
  ; given: 
  ;   image  是 (rectangle 20 40 "solid" "blue")
  ; expected: 
  ;   800

  ; 36.2.6、(define (sting-last str)  盘点（inventory）
  ;            (... img ...))


  (define (image-area img)
    (* (image-height img) (image-width img)))

  (image-area (rectangle 20 40 "solid" "blue"))

; 36.3、思路解析
; 对应的思路，也是写在注释里面了。