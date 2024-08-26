; 20
(define (string_delete str i)
    (string-append(substring str 0 i)(substring str (+ i 1))))

(string_delete "htdp2e" 3)

16 ~ 20 题，加深你对函数的理解