; 11.1、题目
; 题意：定义一个函数，它使用了 x 和 y，并计算点(x,y)到原点的距离。
; 练习 1 中，您为 x 和 y 的具体值开发了这个函数的右侧。现在添加对应函数头。


; 11.2、实现
(define (distance x y)
  (sqrt(+ (sqr x) (sqr y))))

(distance 3 4)
(distance 6 8)

; 11.3、思路解析
; 题目很简单，算是促使你熟悉怎么样定义函数
(define (FunctionName Variable ... Variable)
         Expression)
; 其实只要记得这个表达式就可以了。

; 但这里要注意，从这一章开始，就需要不停定义对应的函数以及变量了，怎么样命名，颇有技巧，所以 代码大全2（纪念版） 第 11 章 《变量名称的威力》（The Power of Variable Names）专门讨论了这个问题，可以参考一下。
; Vscode 中还有个插件 codelf ，可以从 github 上搜索对应的变量名，以供参考。