; 8.1、题目
; 创建一条件表达式，计算图像是高还是宽。如果图像的高度大于或等于宽度，则标记为 "高"；否则标记为 "宽"。关于如何在 DrRacket 中创建此类表达式，请参见练习 1；实验过程中，请用您选择的矩形替换猫，以确保您知道预期的答案。
; 现在试试下面的修改。创建一个表达式，计算图片是 "高"、"宽 " 还是 "正方形"。

; 8.2、实现
(define (image-classify img)  
  (cond
    [(>= (image-height img) (image-width img)) "tall"]
    [(= (image-height img) (image-width img)) "square"]
    [(<= (image-height img) (image-width img)) "wide"]))

(image-classify img) 
;因为是用 vscode 写代码,所以用 img 来代替 DrRacket 中插入的图片,验证时,记得插入实际的图片

; 8.3、题意困惑
; 第 7 题和第 8题，都是同一小节的习题，但困惑的点却不一样。
; 第 7 题，我是读不懂题意；
; 第 8题，我不知道用什么方法来实现；

; 8.4、思路解析
; 第1个麻烦：怎么样显示 tall，wide，square ？
; 给图像贴上标签，首先想到的就是 Python 中的 print 函数，可问题是，仅仅是Hdtp2e 第1章，就没有提及到 print 这个函数。
; 所以，这个题目，我很长一段时间内都不知道怎么样来实现
; 难道不应该主动去搜索一下吗？
; 当时，意识到了这一点，但直觉是我遗漏了某个知识点，和主动搜索没有什么关系。
; 果然题目的答案，在第2章就出来了，36页，习题25，就是这题目的答案；
; 题外话：这本书，并没有给出官方答案，但往往是一题目，后面的章节会有对应的提示。

; 第2个麻烦：if 条件句可行吗 ？
; 使用 cond 这个条件固然可以实现最终的效果，可真要用了 cond ，那么这一小节的知识点就木有掌握到。
; 这一小节是布尔值的混合，最好还是使用布尔值的方法。
; 可问题是，if 的表达式只能表达两个结果
(if question-expression
    then-answer-expression
     else-answer-expression)

; 其实看到这个表达式，就已经明白，单纯使用 if 表达式是解决不了这个题目。
; Pyhon 语言里面有 if …… else 的嵌套用法，这里应该也是可以用嵌套的语法，问题是，这里没有讲到 else 啊？
; 搜了一下，貌似没有讲到 racket 语言下的 if …… else 。

; 看了看别人的答案：
(define cat (bitmap "images/cat.png"))

(if (> (image-height cat) (image-width cat))
    "tall"
    (if (= (image-height cat) (image-width cat))
        "square"
        "wide")) ;=> "tall"

(define image-1 (rectangle 60 40 "solid" "red"))
;;(rectangle 60 40 "solid" "red")


(if (> (image-height image-1) (image-width image-1))
    "tall"
    (if (= (image-height image-1) (image-width image-1))
        "square"
        "wide")) ;=> "tall"

; 传送门：https://github.com/emaphis/HtDP2e-solutions/blob/master/1-Fixed-Size-Data/01-Arithmetic/ex008.rkt

; 咦？
; If 居然能嵌套，试了试这段代码，能运行，不报错。确实木有想到。
; 不死心，继续搜，
; Tyr Chen 的 《Racket 语言入门》 提到了这个语法：
; 参阅这里：https://tyrchen.github.io/racket-book/basics.html#%28part._basics-grammer-cond%29

; 8.5、理解 cond
; 我是看到习题25 （中文版 P36 习题25），突然才意识到我对 cond 的理解不到位。
; Exercise 25 Take a look at this attempt to solve exercise 17: 
(define (image-classify img)
  (cond
    [(>= (image-height img) (image-width img)) "tall"]
    [(= (image-height img) (image-width img)) "square"]
    [(<= (image-height img) (image-width img)) "wide"]))
; Does stepping through an application suggest a fix? 

; 心下一惊，迅速回翻书，开篇中首次提到了cond 条件句：

; In general, a conditional expression has the shape
(cond
  [ConditionExpression1 ResultExpression1]
  [ConditionExpression2 ResultExpression2]
  ...
  [ConditionExpressionN ResultExpressionN])

; ResultExpression 不就是我寻找的展示"tall" "wide" " square" 的方法吗？
; 开篇中当时举得例子，都是数字。潜移默化，我就认为 ResultExpression = 数字，妥妥的误解。
; 所以我前面才有种直觉：我应该是遗漏了某些知识点。
; 其实这书的后面也提到了 cond 更适合来展示复杂的条件，要比 if 优秀好多，if 的一个问题，就是不怎么易读。
