
; 3.1、题目
; 创建一个表达式，在 i 处添加下划线 “_” ，得出最终的结果是“hello_world”

; 3.2、实现
(define str "helloworld")
(define i 5)
(define begin (substring str 0 i))
(define end (substring str i))
(string-append begin "_" end)

; 3.3、思路解析
; 这个题目，显示出作者有丰富的教学经验了，属于前面所说的自我探索，去解决问题。其实我卡在这个题目这里蛮久时间，因为我完全忽视了书中的提示。

; 要实现出最终的效果，需要分 2 步走：
; 第 1 步：分别提取出“hello”和“world”；
; 第 2 步：在“hello”和“world”中指定的位置，本例是 i = 5，加入下划线“_”，即可实现最终的效果；

; 怎么来提取“hello”和“world”，书中其实没有讲，这章节你翻破了书，也没有提示。
; 中文版，该题目位于24页，但对应的提示，却是在在 23 页，里面有一句话：

    ; 1.3 二者的混合
    ; （在初级语言中）所有其他关于字符串的运算都会读入或返回字符串以外的数据。下面是几个例子：
    ; string-length 读入一个字符串并返回一个数值；
    ; string-ith读入字符串s和数值i，提取出位于第1个位置（从0开始计数）的1String；number -＞string 读入一个数值并返回一个字符串。
    ; 查找substring，找出它的作用。
    ; from 《程序设计方法》（第2版）人民邮电出版社 下同

; 依然需要 去 Drracket 中 help desk 中，查 substring 的具体意思
; substring 的用法有好多，但我们目前是初级的水平，所以选 beginner
; substring 的作用就是从字符串中把对应位置的元素，提取出来；
; 题目并不难，难的是形成良好的习惯：主动探索，主动学习，这本书的高明之处。