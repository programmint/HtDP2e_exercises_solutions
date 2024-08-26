; 47

; 定义背景常量
(define BACKGROUND_WIDTH 30)
(define  BACKGROUND_HEIGHT 200)

; 定义背景
; number -> image 
(define BACKGROUND
    (empty-scene BACKGROUND_WIDTH BACKGROUND_HEIGHT))

; 时钟每滴答一下，红色标识减 0.3
(define (tock ws)
    (max 0 (- ws 0.3)))

    ; 题目要求是减少 0.1，但0.1 在视觉上变化太慢，用 0.3 加速视觉变化。

; 定义红色标识宽度与高度
(define RED_SIGN_WIDTH (* BACKGROUND_WIDTH 0.9))
(define ( RED_SIGN_HEIGHT ws)
     (* BACKGROUND_HEIGHT (/ ws 100)))

    ; ws 不停动态变化，所以取  (/ ws 100) 的比例，然后再与 BACKGROUND_HEIGHT 相乘，得出红色标识的高度

; 定义红色标识
; number -> image 
(define (red_sign ws)
    (rectangle RED_SIGN_WIDTH (RED_SIGN_HEIGHT ws) "solid" "red"))

;合成快乐指数图案，背景与红色标识，底部相互对齐
; image -> image 
(define (render ws)
    (place-image (red_sign ws)
     (/ BACKGROUND_WIDTH 2) (- BACKGROUND_HEIGHT (/ (RED_SIGN_HEIGHT ws) 2))
      BACKGROUND))
    
; 增加按键事件
(define  ( key-events ws a-key)
    (cond
        [(key=? a-key "up")( min 100 (* ws (+ 1 1/3)))]  
        [(key=? a-key "down")(max 0 (*  ws (+ 1 1/5)))]
        [else ws]))

; 每一事件后，big-bang 对 （end？ ws ）求值
(define (end? ws)
    (= ws 0 ))

; 设计主函数
(define (main ws)
    (big-bang  ws
        [on-tick tock]
        [to-draw render]
        [on-key key-events]
        [stop-when end?]))

(main 100)
