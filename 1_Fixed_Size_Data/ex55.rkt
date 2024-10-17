; 55

;54 题基础之上，将各个状态下的 place-images 功能都单独定义了函数

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

; ==火箭静止状态常量
(define idle-msg (text "按下空格，发射火箭" 16 "black"))
(define idle-msg-pos (make-posn (- BG-W 470) (- BG-H 25)))
(define rkt-start-pos (make-posn X-START-POS Y-START-POS))
(define idle-img       
    (place-images
            (list idle-msg ROCKET )
            (list idle-msg-pos rkt-start-pos) 
            BACKG))

; ==火箭倒计时状态常量
(define countdown-pos (make-posn X-START-POS ( - BG-H 35)))
(define (countdown-img rkt-state)
    (place-images
        (list (text (number->string rkt-state) 20 "red") ROCKET)
        (list countdown-pos rkt-start-pos)
        BACKG))

; ==火箭飞行状态常量
(define flying-msg (text "火箭正飞行" 16 "black"))
(define flying-msg-pos (make-posn (- BG-W 470) ( - BG-H 230)))
(define (flying-img rkt-state)
        (place-images
            (list flying-msg ROCKET)
            (list flying-msg-pos (make-posn X-START-POS (- Y-START-POS rkt-state))) 
            BACKG))

; ==火箭飞行结束常量
(define end-msg (text "火箭飞行已结束" 16 "red"))
(define end-msg-xpos (- BG-W 470))
(define end-msg-ypos (- BG-H 230))
(define end-img (place-image end-msg end-msg-xpos end-msg-ypos BACKG))

; 按键事件函数
; worldstate key -> worldstate
(define (handle-key rkt-state a-key)
  (cond
    [(and (string? rkt-state) (string=? rkt-state "resting") (key=? a-key " ")) -3]
    [else rkt-state]))

; 按键事件测试案例
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

; 时钟滴答测试案例
(check-expect (tock-y-h "resting") "resting")
(check-expect (tock-y-h 0) 3)
(check-expect (tock-y-h 27) 30)

; 渲染火箭函数
; worldstate -> image
(define (draw-rkt rkt-state)
  (cond
    [(and (string? rkt-state )(string=? rkt-state "resting")) idle-img]
    [(and (number? rkt-state) (<= -3 rkt-state -1)) (countdown-img rkt-state)]
    [(and (number? rkt-state)(>= rkt-state 0)(< rkt-state BG-H)) (flying-img rkt-state)]
    [(= rkt-state BG-H) end-img]))

; 渲染火箭测试案例
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
  (draw-rkt 300) end-img)

; 火箭停止飞行函数
(define (rkt-off-canvas? rkt-state)
  (cond
    [(and (number? rkt-state) (> rkt-state BG-H)) #true]
    [else #false]))

; 火箭停止飞行测试案例
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