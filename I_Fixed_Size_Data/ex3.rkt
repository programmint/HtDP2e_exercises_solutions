;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; 3.1 这题目也是一探索题；

(define str "helloworld")
(define i 5)
(define begin (substring str 0 i))
(define end (substring str i))
(string-append begin "_" end)

;3.2 解析

;这个题目，显示出作者有丰富的教学经验了，属于前面所说的自我探索，去解决问题。其实我卡在这个题目这里蛮久时间，因为我完全忽视了书中的提示。
;要实现出最终的效果，需要分 2 步走：
;第 1 步：分别提取出“hello”和“world”；
;第 2 步：在“hello”和“world”中指定的位置，本例是 i = 5，加入下划线“—”，即可实现最终的效果；
;怎么来提取“hello”和“world”，书中其实没有讲，这章节你翻破了书，也没有提示。其实，在 23 页，里面有一句话：

;二者的混合 
;（在初级语言中）所有其他关于字符串的运算都会读入或返回字符串以外的数据。下面是几个例子：
;string-length 读入一个字符串并返回一个数值；
;string-ith读入字符串s和数值i，提取出位于第1个位置（从0开始计数）的1String；number -＞string 读入一个数值并返回一个字符串。
;查找substring，找出它的作用。
;如果帮助台中的文档不好理解，可以尝试使用交互区的功能。给它们提供适当的参数，并以此找出其计算的内容。
;对于某些运算也可以使用不合适的参数来试试初级语言的反应：

;from 《程序设计方法》（第2版）人民邮电出版社 下同

;3.3 实现

;依然是去 Drracket 中 help desk 中去查：
;substring 的作用就是从字符串中把对应位置的元素，提取出来；所以，实现起来就简单了。