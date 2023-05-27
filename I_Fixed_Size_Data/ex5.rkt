;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex5) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))

;5.1、第 1 次实现（树）
    ;画树，理解了代码即数学
    ;画船，知道了何谓复杂
    
(define (tree standard_heigh) ;定义树的函数,以及输入值的名字
    (overlay/xy  ;建立图形
        (triangle (* standard_heigh 6 ) "solid" "green") ;树冠是三角形，比例取 6
        (* standard_heigh 2 ) (* standard_heigh 5 ) ;向右移动树冠的一半:3,树干有宽度和高度,所以要减去 1 个标准单位;
                                                    ;向下移动树冠的整个高度:6，树干有宽度和高度,所以要减去 1 个标准单位;
                                                    
        (rectangle (* standard_heigh 2 ) (* standard_heigh 4 )"solid" "gray"))) ;树干高度比例取 4

(tree 15) ;实例，只需要修改一个参数,就可以自由改变图像的大小


;5.2、构思

;第1步：问题是要求样画船或树，可以想到的是，overlay/xy，这里先画树，后面船我也画了，也正是画船，意识到 overlay/xy 的局限。
;第2步：轻松更改整个图像的范围，怎么样才算是轻松？这里很关键；

;做这个题目时，这里的思路有一连串的变化
;题目要求，可以轻松更改整个图形的范围，也就是说可以随意修改图像的大小
;假设树由三角形（树冠）和矩形（树干）组成，三角形，我们使用等边三角形，矩形则是由不同的宽度和高度组成；
;定义的函数，这里面会有3个参数，三角的边长，矩形的宽度和高度，这里就有一个问题，更改图像大小，
;需要一次性改动 3 个参数,这就不叫随意了。

;书中开篇的火箭落地函数，已经告诉你了，修改 1 个参数，才是轻松。
;搜了一下具体的树种，例如庭荫树
;遮阴为目的的树木，由于最常用于建筑的庭院中，故习称庭荫树。
;庭荫树的分枝点应随着树木生长逐步提高，树冠与树干高度的比例应为 7：3 至 6：4 之间(from 网络),
;这里的比例，我们选用 6：4 ，因为是偶数，便于运算； 

;所以修改轻松，其实就是利用比例关系来确定数值，所以有了第 1 次实现方式；

;5.3 总结
;第 1 步：树的图形，采用矩形和三角形组合（其实我还是忽视了1个问题，后面会体现出来）
;第 2 步：轻松修改，是指只修改 1 个参数，所以树的图形，要依据一定的比例确定



;5.4、代码出问题
;验证代码时，一时好奇，忍不住修改了一下参数，即把树干的参数修改了，由原来的 2：4，修改为 4：8，问题一下子来了。

(define (tree standard_heigh) 
    (overlay/xy 
        (triangle (* standard_heigh 6 ) "solid" "green") 
        (* standard_heigh 2 ) (* standard_heigh 5 ) 
        (rectangle (* standard_heigh 4 ) (* standard_heigh 8 )"solid" "gray"))) ;注意，这里的比例关系有了变化；

(tree 15) ;实例，你会发现运行之后的图像很怪；


;5.4、查问题
;仔细看了看代码
;第1、改变了树冠与树干的比例关系，所以生成的图形很怪异。树冠比例是 6：4 ，我修改之后变成了 6：8
;第2、有个很严重的问题，我把三角形的边，给理解为边 = 高了，小学木有毕业！

;问题结论：代码确实是数学，文科生伤不起啊！


;5.5、第2次实现（树）

(define (tree standard_heigh) ;定义树的函数,以及输入值的名字
    (overlay/xy  ;建立图形
        (triangle (* standard_heigh 6 ) "solid" "green") ;树冠是三角形，比例取 6
        (* standard_heigh 2 ) (* standard_heigh 5 ) ;向右移动树冠的一半:3,树干有宽度和高度,所以要减去 1 个标准单位;
                                                    ;向下移动树冠的整个高度:6，树干有宽度和高度,所以要减去 1 个标准单位;
                                                    
        (rectangle (* standard_heigh 2 ) (* standard_heigh 4 )"solid" "gray"))) ;树干高度比例取 4

(tree 15) ;实例，只需要修改一个参数,就可以自由改变图像的大小