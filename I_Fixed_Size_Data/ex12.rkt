
; 12.1、题目
; 定义函数 cvolume，它接受等边立方体的边长并计算其体积。如果有时间，也可以考虑定义csurface。（表面积）

; 12.2、实现
(define (cvolume x)
    (expt x 3))

(cvolume 3)

; 12.3、思路解析
; 这个题目比较简单，函数的行数也不多。
; 但这样子写，其实是有问题。

; 问题1、x 是 0 会怎么样？
; 现实中没有这样子的正立方体。假如输入的是负数呢，现实中也没有这样子的正立方体。
; 所以说还需要对输入的条件，加以判断；
; 不过这里着重是考察对函数的掌握，所以包含判断条件的函数就不写了，可以使用 if 语句，也可以使用 cond 语句，我个人更倾向于使用 cond 语句；

; 问题2、x 作为变量名，合适吗？
; 用 x 作为边长的名称，合适吗，其实还是不怎么合适。稍微搜索，可知边长的英文名是：edge length，所以这里的变量名称应该是edge_length，所以修改如下：
(define (cvolume edge_lenth)
    (expt edge_length 3))

(cvolume 3)

; 问题3、冥的表示方式？
; 我确实看过这样子的表示方式：
(define (cvolume edge_lenth)
  (* edge_lenth edge_lenth edge_lenth))

; 这个题目，并不复杂，所以使用这种方式，也没有问题。
; 但如果面对的变量复杂，要解决的问题也复杂，这种方式就不合适了。
; 所以，搜索一下，便知有个内置函数可以直接调用

(expt x y) → number
 ;x : number
 ;y : number
;Computes the power of the first to the second number.

; 使用这种方式会更好一些。
