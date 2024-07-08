;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex33) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


    ; ; 1.1、生成车轮
    ; ; number -> image 
    ; (define WHEEL_RADIUS 5) ;车轮半径为单一控制点，本题起始点，优先定义它
    ; (define WHEEL (circle WHEEL_RADIUS "solid" "black")) 

    ; ; 1.2、生成车身底部
    ; ; number -> image
    ; (define UNDERBODAY_SPACE 
    ;         (rectangle …))

    ; (define CAR_UNDERBODY
    ;     (overlay/offset 
    ;             (…)))

    ; ; 1.3、生成车身
    ; ; number -> image
    ; (define CAR_BODY
    ;             (above
    ;                 (rectangle …)
    ;                 (rectangle …)))
            
    ; ; 1.4、生成整车
    ; ; image -> image 
    ; (define CAR
    ;             (above …)) ; 我最初是想用 above

; CAR


; 39、WISH LIST
    ;汽车用图像表示，WHEEL 作为单一控制点
    ;汽车各部分比例关系，参考：https://zhuanlan.zhihu.com/p/599598162
    ;具体关系比例：车轮半径 ：车身长 ： 车高 = 1：14 ：3


    ; 1.1、生成车轮
    ; number -> image 
    (define WHEEL_RADIUS 5) ;车轮半径为单一控制点，本题起始点，优先定义它
    (define WHEEL (circle WHEEL_RADIUS "solid" "black")) 

    ; 1.2、生成车身底部
    ; number -> image
    (define UNDERBODAY_SPACE 
            (rectangle ( * WHEEL_RADIUS 14)(* WHEEL_RADIUS 2) "outline" (make-color 0 0 0 0)))

            ; 书里给的变量 space ，我没有去用
            ; (define SPACE (rectangle ... WHEEL_RADIUS ... "white"))
            ; space 这变量，从命名来说，根本不知道是用在那里的一个变量
            ; 只能是通过，看代码才知道是怎么回事
            ; 汽车设计里面，有一概念，轴距，指两车轮之间的距离，这个参数对车实体设计非常重要
            ; 但在虚拟程序里，这个参数用不上

    (define CAR_UNDERBODY
        (overlay/offset 
                (overlay/offset
                UNDERBODAY_SPACE
                    (- 0 (* WHEEL_RADIUS 3.5)) 0 ; 第 1 个车轮向左平移3.5倍车轮半径像素 
                    WHEEL)
            (* WHEEL_RADIUS 3.5) 0 ; 第 2 个车轮向右平移3.5倍车轮半径像素
            WHEEL))
        
        ;这一步，我们简单点运用，其实车辆设计，这里的空间包含：前悬，轴距，后悬，最小离地间隙等参数。


    ; 1.3、生成车身
    ; number -> image
    ; 车身有两部分组成，上半部分，下半部分
    ; 车身上半部分，宽:高 = 7 倍 WHEEL_RADIUS ：1 倍 WHEEL_RADIUS
    ; 车身下半部分，宽:高 = 14 倍 WHEEL_RADIUS ：2 倍 WHEEL_RADIUS
    (define CAR_BODY
                (above
                    (rectangle (* WHEEL_RADIUS 7) (* WHEEL_RADIUS 1)"solid" "red")
                    (rectangle (* WHEEL_RADIUS 14) (* WHEEL_RADIUS 2) "solid" "red")))
            
    ; 1.4、生成整车
    ; image -> image 
    ; (define CAR
    ;             (above CAR_BODY CAR_UNDERBODY))

    (define CAR
                (overlay/offset
                    CAR_UNDERBODY
                    0 (- 0 (* WHEEL_RADIUS 1.5))
                    CAR_BODY
                ))

; CAR


; ;40、WISH LIST
; ; 时钟滴答一次，汽车移动 3 像素，从画布左侧算起，注意：使用 check-expect 引入错误,查看效果
; ; worldstae -> worldstae
; ; 
; ; 2.1.生成背景,把车放进去
; ; number -> image 
; (define (background_space 
;     (rectangle ()()"outline" "white")))

; (overlay/align)
; ; 2.2.定义移动函数, 加入 check-expect,检验错误数值

; (define worldsate)

; ;第一次做题时的思路，可以说我是想把一切提前实现了。


;40、WISH LIST
; 时钟滴答一次，汽车移动 3 像素，从画布左侧算起，注意：使用 check-expect 引入错误,查看效果
; worldstae -> worldstae
;examples:
;   given : 20 , expect:23
;   given : 27 , expect:30
(define (tock ws)
    (+ ws 3))

; (check-expect(tock 20) 23)
; (check-expect(tock 27) 30)
; (check-expect(tock 30) 36) ;错误的结果

;41、WISH LIST
    ; WorldState -> Image 
    ;（这一道小小的题目，也是一复合函数题目）

;41.1、定义背景图片 （不用多想，背景图片也是单点控制）
; number -> Image 
;定义 CAR 时,车长 =  14 * WHEEL_RADIUS ，车高 =  4 * WHEEL_RADIUS 
;所以背景的长宽，都要比车大，取偶数

(define BACKGROUND 
    (empty-scene (* WHEEL_RADIUS 60)(* WHEEL_RADIUS 8))) 

;41.2、把车图片放置背景内
; WorldState -> Image 
;examples:
    ;given : 20 , expect:23
    ;given : 27 , expect:30
(define Y-CAR 
    (* WHEEL_RADIUS 6))  ;

(define (render ws)
    (place-image CAR ws Y-CAR BACKGROUND)) 
; (check-expect(tock …) …)

;41.3、背景内添加一棵树
; (define tree ;树函数，已经给出，直接引用过来
;     (underlay/xy (circle 10 "solid" "green")
;             9 15
;             (rectangle 2 20 "solid" "brown"))) 


;41.4、汽车消失在右侧后，动画停止
;Worldstae -> Worlstate
(define (main ws)
    (big-bang ws
        [on-tick tock]
        [to-draw render]    
        [stop-when zero?]))

(main 0)







