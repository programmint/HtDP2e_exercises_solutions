; 53

; 共包含 2 种思路
; 思路1、运用条目思路
; 思路2、运用事件驱动编程思路

; -- 思路 1 ：运用条目思路 ------------------------------------------------------------------------------------------------------------------

; === 数据定义
; An LR (short for launching rocket) is one of:
; – "resting"
; – NonnegativeNumber
; interpretation: "resting" represents a grounded rocket
; a number denotes the height of a rocket in flight

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
(define RKT-X-POS (/ BG-W 2))
(define INIT-Y-POS (- BG-H RKT-CTR))
; 高度定义
; 地面与火箭中心距离

; 按键函数：火箭静止，且只有按下空格键后，火箭才发射
; LR KeyEvent -> LR
(define (handle-key rkt-state a-key)
  (cond
    [(and (string? rkt-state) (key=? a-key " ")) INIT-Y-POS] 
    [else rkt-state])) 

; 时钟函数：每滴答一次，火箭上升 3像素
; LR -> LR
(define (rkt-tock rkt-state)
  (cond
    [(and (number? rkt-state) (> rkt-state 0)) (- rkt-state Y-DELTA)] 
    [else rkt-state]))

; 火箭函数：时钟滴答一次，实时绘制火箭一次
; LR -> Image
(define (draw-rkt rkt-state)
    (place-image ROCKET
        RKT-X-POS
        (cond
            [(string? rkt-state) INIT-Y-POS]
            [(>= rkt-state 0) rkt-state])
    BACKG))

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
            (on-tick rkt-tock)
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
(define INIT-Y-POS (- BG-H RKT-CTR))

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
        [(and (eq? rkt-state RESTING) (key=? a-key " ")) INIT-Y-POS]
        [else rkt-state]))

; 定义火箭飞行水平位置
; number -> number 
(define RKT-X (/ BG-W 2))

; 定义火箭飞行高度
; number -> number 
(define (rkt-tock rkt-state)
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
            [else INIT-Y-POS])
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
        (on-tick rkt-tock)
        (to-draw draw-rkt)
        (on-key handle-key)
        (stop-when rkt-off-canvas?)))

; 测试 rkt-tock
(check-expect (rkt-tock 100) 97) 
(check-expect (rkt-tock 'resting) 'resting) 

; 测试 handle-key
(check-expect (handle-key 'resting "a") 'resting)  
(check-expect (handle-key 'resting " ") INIT-Y-POS)
(check-expect (handle-key 100 " ")100) 

; 测试 rkt-off-canvas?
(check-expect (rkt-off-canvas? 'resting) #false)
(check-expect (rkt-off-canvas? 0) #true)
(check-expect (rkt-off-canvas? 60) #false)

(main RESTING)