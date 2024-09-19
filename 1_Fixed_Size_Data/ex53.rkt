; 53
; wish list
; 火箭飞行，初始位于地面上
; 按下空格，开始飞行

; Core ideas
; 解决这个题目，重在其中的状态 (rocket-state)，在 big-bang 各个子函数之间正确流转
; 引用 big-bang 函数时，状态怎么样合理流转，始终都要注意它

; 定义背景
; number image -> image
(define BACKG-WIDTH 100)
(define BACKG-HEIGHT 300)
(define BACKG (empty-scene BACKG-WIDTH BACKG-HEIGHT))

; 定义火箭
; number image -> image
(define ROCKET-WIDTH 5)
(define ROCKET-HEIGHT 30)
(define ROCKET (rectangle ROCKET-WIDTH ROCKET-HEIGHT "solid" "red"))

; 定义火箭初始位置
; number -> number
(define INITIAL-POSITION BACKG-HEIGHT)

; 定义火箭状态常量
; worldstate -> worldstate
(define RESTING 'resting)

; 定义飞行高度速率
; number -> number
(define Y-DELTA 3)

; 定义空格事件
; 只有按下空格，火箭才飞行，否则保持不动。
; worldstate keyevent -> worldstate
(define (handle-key rocket-state a-key)
    (cond
        [(and (eq? rocket-state RESTING) (key=? a-key " ")) INITIAL-POSITION]
        [else rocket-state]))

; 定义火箭飞行水平位置
; number -> number 
(define ROCKET-X-POSITION (/ BACKG-WIDTH 2))

; 定义火箭飞行高度
; number -> number 
(define (rocket-y-position rocket-state)
    (cond
        [(number? rocket-state)(- rocket-state Y-DELTA)]
        [else rocket-state]))

; 绘制火箭
; number image -> image
(define ( flying-rocket rocket-state)
    (place-image ROCKET
        ROCKET-X-POSITION
        (cond
            [(number? rocket-state) rocket-state]
            [else INITIAL-POSITION])
    BACKG))

; 检验火箭是否停止飞行
; worldstate ->boolean
(define ( rocket-off-canvas? rocket-state)
    (and
        (number? rocket-state)
        (<= rocket-state 0)))

; 定义主函数
(define (main rocket-state)
    (big-bang rocket-state
        (on-tick rocket-y-position)
        (to-draw flying-rocket)
        (on-key handle-key)
        (stop-when rocket-off-canvas?)))

; 测试 rocket-y-position
(check-expect (rocket-y-position 100) 97) 
(check-expect (rocket-y-position 'resting) 'resting) 

; 测试 handle-key
(check-expect (handle-key 'resting "a") 'resting)  
(check-expect (handle-key 'resting " ") INITIAL-POSITION)
(check-expect (handle-key 100 " ")100) 

; 测试 rocket-off-canvas?
(check-expect (rocket-off-canvas? 'resting) #false)
(check-expect (rocket-off-canvas? 0) #true)
(check-expect (rocket-off-canvas? 60) #false)

(main RESTING)