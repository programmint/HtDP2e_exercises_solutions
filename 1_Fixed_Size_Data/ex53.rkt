; 53

; 共包含 2 种思路
; 思路1、运用条目思路（推荐这思路，更贴合题意）
; 思路2、运用事件驱动编程思路

; -- 思路 1 ：运用条目思路 ------------------------------------------------------------------------------------------------------------------

; === 数据定义
; An LR (short for launching rocket) is one of:
; – "resting"
; – NonnegativeNumber
; interpretation: "resting" represents a grounded rocket
; a number denotes the height of a rocket in flight

; 高度定义
; 地面与火箭中心距离

; == 背景常量
; number image -> image
(define BG-W 100) 
(define BG-H 300)
(define BACKG (empty-scene BG-W BG-H))

; == 火箭常量
; number image -> image
(define RKT-W 5)
(define RKT-H 30)
(define RKT-CTR (/ RKT-H 2)) 
(define ROCKET (rectangle RKT-W RKT-H "solid" "red")) 

; == 火箭飞行常量
(define Y-DELTA 3)  
(define X-START-POS (/ BG-W 2))
(define Y-START-POS (- BG-H RKT-CTR))

; 按键函数：火箭静止，且只有按下空格键后，火箭才发射
; LR KeyEvent -> LR
(define (handle-key rkt-state a-key)
  (cond
    [(and (string? rkt-state) (key=? a-key " ")) Y-START-POS] 
    [else rkt-state])) 


; 时钟函数：每滴答一次，火箭上升 3像素
; LR -> LR
(define (tock-y-h rkt-state)
  (cond
    [(and (number? rkt-state) (> rkt-state 0)) (- rkt-state Y-DELTA)] 
    [else rkt-state]))


; 火箭函数：时钟滴答一次，实时绘制火箭一次
; LR -> Image
(define (draw-rkt rkt-state)
    (place-image ROCKET
        X-START-POS
        (cond
            [(string? rkt-state) Y-START-POS]
            [(>= rkt-state 0) rkt-state])
    BACKG))

; 注，到了第 55 题，就会提醒你，place-image  可以单独定义为函数。

; 火箭超出画布时停止飞行
; LR -> Boolean
(define (rkt-off-canvas? rkt-state)
  (cond
    [(and (number? rkt-state) (< rkt-state 0)) #true]
    [else #false])) ; 其他情况下继续飞行

; 火箭主函数
(define (main rkt-state)
  (big-bang rkt-state
            (to-draw draw-rkt)
            (on-key handle-key)
            (on-tick tock-y-h)
            (stop-when rkt-off-canvas?)))

(main "resting")


; -- 思路 2 ：运用事件驱动编程思路 --------------------------------------------------------------------------------------------------------

; big-bang 隶属“事件驱动编程”，其中的状态 (本题命名为：rkt-state)，在 big-bang 各个子函数之间正确流转极为重要
 
; 定义背景
; number image -> image
(define BG-W 100)
(define BG-H 300)
(define BACKG (empty-scene BG-W BG-H))

; 定义火箭
; number image -> image
(define RKT-W 5)
(define RKT-H 30)
(define RKT-CTR ( / RKT-H 2))
(define ROCKET (rectangle RKT-W RKT-H "solid" "red"))

; 定义火箭初始位置
; number -> number
(define Y-START-POS (- BG-H RKT-CTR))

; 定义火箭状态常量
; worldstate -> worldstate
(define RESTING 'resting)

; 定义飞行高度速率
; number -> number
(define Y-DELTA 3)

; 定义空格事件
; 只有按下空格，火箭才飞行，否则保持不动。
; worldstate keyevent -> worldstate
(define (handle-key rkt-state a-key)
    (cond
        [(and (eq? rkt-state RESTING) (key=? a-key " ")) Y-START-POS]
        [else rkt-state]))

; 定义火箭飞行水平位置
; number -> number 
(define RKT-X (/ BG-W 2))

; 定义火箭飞行高度
; number -> number 
(define (tock-y-h rkt-state)
    (cond
        [(number? rkt-state)(- rkt-state Y-DELTA)]
        [else rkt-state]))

; 绘制火箭
; number image -> image
(define ( draw-rkt rkt-state)
    (place-image ROCKET
        RKT-X
        (cond
            [(number? rkt-state) rkt-state]
            [else Y-START-POS])
    BACKG))

; 检验火箭是否停止飞行
; worldstate ->boolean
(define ( rkt-off-canvas? rkt-state)
    (and
        (number? rkt-state)
        (<= rkt-state 0)))

; 定义主函数
(define (main rkt-state)
    (big-bang rkt-state
        (on-tick tock-y-h)
        (to-draw draw-rkt)
        (on-key handle-key)
        (stop-when rkt-off-canvas?)))

; 测试 tock-y-h
(check-expect (tock-y-h 100) 97) 
(check-expect (tock-y-h 'resting) 'resting) 

; 测试 handle-key
(check-expect (handle-key 'resting "a") 'resting)  
(check-expect (handle-key 'resting " ") Y-START-POS)
(check-expect (handle-key 100 " ")100) 

; 测试 rkt-off-canvas?
(check-expect (rkt-off-canvas? 'resting) #false)
(check-expect (rkt-off-canvas? 0) #true)
(check-expect (rkt-off-canvas? 60) #false)

(main RESTING)