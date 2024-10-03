; 54 

; 数据定义 
; An LRCDCD (for launching rocket countdown) is one of:
; – "resting"
; – a Number between -3 and -1
; – a NonnegativeNumber 
; interpretation a grounded rocket, in countdown mode,
; a number denotes the number of pixels between the
; top of the canvas and the rocket (its height)

; 高度定义
; 地面与火箭中心之间的距离

; Core ideas
; 火箭状态：静止 -> 倒计时 -> 飞行 -> 停止
; 主要使用了 place-images，place-image 嵌套不易读

; ==背景常量
; nubmer,image -> iamge 
(define BG-W 600) 
(define BG-H 300)
(define BACKG (empty-scene BG-W BG-H))

; ==火箭常量
; nubmer,image -> iamge 
(define RKT-W 5)
(define RKT-H 30)
(define RKT-CTR (/ RKT-H 2)) 
(define ROCKET (rectangle RKT-W RKT-H "solid" "red")) 

; ==飞行参数常量
; number -> number 
(define YDELTA 3)  
(define X-START-POS (/ BG-W 2))
(define Y-START-POS (- BG-H RKT-CTR))

; ==飞行状态描述常量
(define idle-msg (text "按下空格，发生火箭" 16 "black"))
(define idle-msg-pos (make-posn (- BG-W 470) (- BG-H 25)))

(define rkt-start-pos (make-posn X-START-POS Y-START-POS))
(define countdown-pos (make-posn X-START-POS ( - BG-H 35)))

(define flying-msg (text "火箭正飞行" 16 "black"))
(define flying-msg-pos (make-posn (- BG-W 470) ( - BG-H 230)))

(define end-msg (text "火箭飞行已结束" 16 "red"))
(define end-msg-xpos (- BG-W 470))
(define end-msg-ypos (- BG-H 230))
(define end-scene (place-image end-msg end-msg-xpos end-msg-ypos BACKG))

; 按键事件函数
; worldstate key -> worldstate
(define (handle-key rkt-state a-key)
  (cond
    [(and (string? rkt-state) (string=? rkt-state "resting") (key=? a-key " ")) -3]
    [else rkt-state]))

; 测试案例
(check-expect (handle-key "resting" " ") -3 )
(check-expect (handle-key "abc" " ") "abc" )
(check-expect (handle-key 27 " ") 27 )


; 时钟滴答函数
; worldstate -> worldstate
(define (tock-y-h rkt-state)
  (cond
    [(and (string? rkt-state) (string=? rkt-state "resting")) rkt-state]
    [(<= -3 rkt-state -1 ) (+ rkt-state 1)]
    [(and (number? rkt-state) (= rkt-state 0)) YDELTA]
    [(and (number? rkt-state) (> rkt-state 0)) (+ rkt-state YDELTA)]
    [else rkt-state]))

; 测试案例
(check-expect (tock-y-h "resting") "resting")
(check-expect (tock-y-h 0) 3)
(check-expect (tock-y-h 27) 30)


; 渲染火箭函数
; worldstate -> image
(define (draw-rkt rkt-state)
  (cond
    [(and (string? rkt-state )(string=? rkt-state "resting"))
        (place-images
            (list idle-msg ROCKET )
            (list idle-msg-pos rkt-start-pos) 
            BACKG)]

    [(and (number? rkt-state) (<= -3 rkt-state -1))
        (place-images
            (list (text (number->string rkt-state) 20 "red") ROCKET)
            (list countdown-pos rkt-start-pos)
            BACKG)]

    [(and (number? rkt-state)(>= rkt-state 0)(< rkt-state BG-H))
        (place-images
            (list flying-msg ROCKET)
            (list flying-msg-pos (make-posn X-START-POS (- Y-START-POS rkt-state))) 
            BACKG)]

      [(= rkt-state BG-H) end-scene]))

; 测试案例
(check-expect 
  (draw-rkt "resting")
  (place-images
    (list idle-msg ROCKET)
    (list idle-msg-pos rkt-start-pos )
    BACKG))

(check-expect 
  (draw-rkt -3)
  (place-images
            (list (text (number->string -3 ) 20 "red") ROCKET)
            (list countdown-pos rkt-start-pos)
            BACKG))

(check-expect 
  (draw-rkt -1)
  (place-images
            (list (text (number->string -1 ) 20 "red") ROCKET)
            (list countdown-pos rkt-start-pos)
            BACKG))

(check-expect 
  (draw-rkt 100)
  (place-images
    (list flying-msg ROCKET)
    (list flying-msg-pos (make-posn X-START-POS (- Y-START-POS 100))) 
    BACKG))

(check-expect 
  (draw-rkt 300) end-scene)

; 火箭停止飞行函数
(define (rkt-off-canvas? rkt-state)
  (cond
    [(and (number? rkt-state) (> rkt-state BG-H)) #true]
    [else #false]))

(check-expect (rkt-off-canvas? 303) #true)

; 定义世界程序
; worldstate -> any
(define (main rkt-state)
  (big-bang rkt-state
            (to-draw draw-rkt)
            (on-key handle-key)
            (on-tick tock-y-h)
            (stop-when rkt-off-canvas?)))

(main "resting")  ; 传入预设的状态 “resting”  