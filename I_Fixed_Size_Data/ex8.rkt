;实现
(define (image-classify img)  
  (cond
    [(>= (image-height img) (image-width img)) "tall"]
    [(= (image-height img) (image-width img)) "square"]
    [(<= (image-height img) (image-width img)) "wide"]))

(image-classify img) 
  ;因为是用vscode 写代码,所以用 img 来代替 DrRacket 中插入的图片,验证时,记得插入实际的图片


;思路
;第1个麻烦,显示 tall,wide,square

;这个题目包含了2个小题目。我在实际做时,居然是直接把二个小题目合在了一起。
;第1个小题
;是给图像贴上标签,我首先想到的就是 Python 中的 print 函数,可问题是,仅仅是第1章,就没有提及到 print 这个函数
;所以,这个题目,我很长一段时间内都不知道怎么样来实现
;难道不应该主动去搜索一下吗？
;当时,意识到了这一点,但直觉是我忽视了什么知识点,和主动搜索没有什么关系。
;果然题目的答案,在第2章就出来了,36页,习题25,就是这题目的答案;

;第2个小题
;使用 cond 这个条件固然可以实现最终的效果,可真要用了 cond ,那么这一小节的知识点就木有掌握到。
;这一小节是布尔值的混合,最好还是使用布尔值的方法。
;可问题是,if 的表达式只能表达两个结果
(if question-expression
    then-answer-expression
     else-answer-expression)
;其实看到这个表达式,就已经明白,单纯使用 if 表达式是解决不了这个题目。
;Pyhon 语言里面有 if …… else 的嵌套用法,这里应该也是可以用嵌套的语法,问题是,这里没有讲到 else 啊？搜了一下,貌似没有讲到racket 语言下的 if …… else 。
;看了看别人的答案：

(define rec (rectangle 50 50 "outline" "red"))

(if (> (image-height rec) (image-width rec))
      "tall"
      (if (< (image-height rec) (image-width rec))
          "wide"
          (if (= (image-height rec) (image-width rec))
              "equal"
              "error")))
;from：https://github.com/MarcusPlieninger/HtDP_2e_solutions/blob/master/HtDP_2e_Exercise_008.rkt
;我第1反应：if 居然能嵌套。试了试这段代码,能运行,不报错。确实木有想到。
;Tyr Chen 的 《Racket 语言入门》提到了这个语法：https://tyrchen.github.io/racket-book/basics.html 
;可自行详细阅读,记得下滑页面,在页面的中下部分。