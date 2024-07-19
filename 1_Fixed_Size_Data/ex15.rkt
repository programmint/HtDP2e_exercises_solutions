
; 15.1、题目
; 定义函数 ==>，该函数使用了两个布尔值，分别是 sunny 和 friday。如果 sunny 为假或者 friday 为真，它的答案是#true。

; 15.2、参考实现
; 怎么样解这个题目，有点说来话长，实际上我就一直没有解对。
(define (==> p q)
  (or (not p) q))

;; imply truth table
(==> #true  #true)  ; #true
(==> #true  #false) ; #false
(==> #false #true)  ; #true
(==> #false #false) ; #true

; 参考他人的答案：https://github.com/emaphis/HtDP2e-solutions/blob/master/1-Fixed-Size-Data/02-Functions/ex015.rkt
; 这个思路，我觉得最为贴合题意。

; 15.3、错误的参考
; 这个题目和第 7 题非常相似，二者我都是读不懂。
; 后面读懂了第 7 题，自然而然依据第 7 题的思路去实现，表面上看表达式是正确的，可是一运行马上报错。
(define sunny #false)
(define friday #true)

(define (==> sunny friday)
  (or (not sunny) friday))

(==> sunny friday)

; https://github.com/MarcusPlieninger/HtDP_2e_solutions/blob/master/HtDP_2e_Exercise_015.rkt
; 当然了，这个答案，是我参考github上别人的，点击浏览 ，不过当时确实觉得这样子表述是可以的，终归还是理解不到位。

; 15.4、题意分析
; 这题目看上去与第 7 题一致，实则不然。
; 第 7 题 是明确给定了条件和结果，推导过程。
; 这个题目看上去也是如此，其实是给了模糊的条件，也给了模糊的结果，然后你去推导中间过程。
; 模糊与清晰，二者差异极大。
; 第1、读取的布尔值
; 定义的函数用到两个布尔值，这两个布尔值到底是 #ture 还是 #false，没有明确说明，我称之为模糊。
; 第2、运行的结果
; 只是告诉你，如果 sunny 是 #false 或者 friday 为 #ture ，那么结果是 #ture ，那么 sunny 是  #ture 或者 friday 为 #false，那么结果是什么？没有讲，所以，我称之为结果也模糊。

; 只要是看到 “或者” 一词，就明确了，函数应该是使用 or 了。

; 15.5、正确思路

(define sunny #false)  
(define friday #true)

(define (==> sunny friday)
  (or (not sunny) friday))

(==> sunny friday)

; 这个参考答案，不能说是错，仅仅从解题来说，可以出最终的结果，但狭隘了一些。sunny 和 friday ，到底是怎么样的布尔值，没有明确讲，所以这里只使用了一种布尔值，狭隘了。

; 再看题意：如果 sunny 是 #false 或者 friday 为 #ture ，那么结果是 #ture
; 所以 ，

; 推导表达式
; （#false #ture）; #ture 
; 那么肯定是用 or，即:

; （or #false #ture）; #ture 

; 既然如此，如下：
; （ or #ture #ture）; 肯定也是 #ture

; 得出表达式

;这时函数的表达式，其实已经出来了
(or (not variable1) variable2)

;当然了，这个表达式，反过来也可以
(or variable1 (not variable2))

; 15.6、定义常量
; 前面已经分析了，sunny 和 Friday 到底是怎么样的布尔值，并没有清晰告知，所以：
(define sunny #false)  
(define friday #true)

;采用这种方式，不能把所有的布尔值都包含进去
;也就是说，该题目，不必定义常量，而是把各个布尔值，直接引用就好了。

; 15.7、又翻车
; 试运行函数，没有想到：
; 居然报错，怎么回事，明明是定义了函数啊! 我查了半天，还是找不到解决思路，只能是再等等了。
