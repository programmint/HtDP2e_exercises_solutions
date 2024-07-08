;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;习题1 将以下关于x和y的定义添加到DrRacket的定义区：

(define x 3)
(define y 4)

;接下来，想象x和y是某个点的笛卡儿坐标。写出计算该点到原点的距离的表达式，原点就是坐标为（0，0）的点。

;1.1、实现
;这一题是预热题,很简单,但也是一道探索题;

(define x 3) ; 以后会学到,这里定义了一个常量 x = 3
(define y 4) ; 同理,定义了一个常量 y = 4

(sqrt (+ (sqr x) (sqr y))) ; 求平方根公式;

;1.2、思路解析
;之所以说这题也是探索题,文中提到了平方根的方法是：sqrt,可是平方和(sqr)的方法却没有提,需要你自己去查。
;这就是本书的特点,有些知识点,直接忽略掉,得需要你自己去补充完整。





































