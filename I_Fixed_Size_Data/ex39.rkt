
; 39.1、有言在先
; 这题采用的思路，和书里稍有不同。

; 39.2、题目
; 开发你最喜欢的汽车图像，使用 WHEEL-RADIUS 作为单一控制点。

; 39.3、实现-思路状态
; WISH LIST 
; WorldState：current world (cw) 由多类型 data 表示   
 
    ; 39.3.1、生成世界状态的图像
    ; WorldState -> Image
    (define (render cw) ...)
    
    ; 39.3.2、时钟跳动，获取下一个世界状态
    ; WorldState -> WorldState
    (define (clock-tick-handler cw) ...)
    

    ; 39.3.3、按键事件，获取下一个状态;
    ; WorldState，String -> WorldState 
    (define (keystroke-handler cw ke) ...) ; ke 代表按键
    
    ; 39.3.4、鼠标手势，获取下一个状态;
    ; Number Number String -> WorldState 
    (define (mouse-event-handler cw x y me) ...)     ;x 和 y 是事件的坐标，me 是事件描述 
    
    ; 39.3.5、每次事件后，检查 end 的值
    ; WorldState -> Boolean
    (define (end? cw) ...)

; 39.4、实现-完成状态
    ; WISH LIST
    ;汽车用图像表示，WHEEL 作为单一控制点
    ;汽车各部分比例关系，参考：https://zhuanlan.zhihu.com/p/599598162
    ;具体关系比例：车轮半径 ：车身长 ： 车高 = 1：14 ：3


    ; 39.4.1、生成车轮
    ; number -> image 
    (define WHEEL_RADIUS 5) ;车轮半径为单一控制点，本题起始点，优先定义它
    (define WHEEL (circle WHEEL_RADIUS "solid" "black")) 

    ; 39.4.2、生成车身底部
    ; number -> image
    (define UNDERBODAY_SPACE 
            (rectangle ( * WHEEL_RADIUS 14)(* WHEEL_RADIUS 2) "outline" (make-color 0 0 0 0)))
            
            ;outline 是透明的


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
        
        ;综上，我们是简单定义车身。
        ;现实中，车辆底部空间包含：前悬，轴距，后悬，最小离地间隙等参数,并非那么简单。
        


    ; 39.4.3、生成车身
    ; number -> image
    ; 车身有两部分组成，上半部分，下半部分
    ; 车身上半部分，宽:高 = 7 倍 WHEEL_RADIUS ：1 倍 WHEEL_RADIUS
    ; 车身下半部分，宽:高 = 14 倍 WHEEL_RADIUS ：2 倍 WHEEL_RADIUS
    (define CAR_BODY
                (above
                    (rectangle (* WHEEL_RADIUS 7) (* WHEEL_RADIUS 1)"solid" "red")
                    (rectangle (* WHEEL_RADIUS 14) (* WHEEL_RADIUS 2) "solid" "red")))
            
    ; 39.4.4、生成整车
    ; image -> image 
    ; (define CAR 
    ;     (above CAR_BODY CAR_UNDERBODY)) 
    
    ; 最初我用 above，效果不佳，才转用 overlay/offset
  
  
     (define CAR
                (overlay/offset
                    CAR_UNDERBODY
                    0 (- 0 (* WHEEL_RADIUS 1.5)) ;CAR_BODY 向上移动
                    CAR_BODY ))

    CAR

; 39.5 反思
; 用了一简单的题目，来模仿复杂的程序，如果只是解决该题，不必如此啰嗦。
; 同时，代码里的一些小地方，小有瑕疵，例如，里面的比例系数，应该定义为常量，而非直接写在里面，不然改动时不好改。（书里示例代码，也犯了这个毛病）
; 不过，这一章，重在掌握设计思路，这些小瑕疵，暂时不必在意。
