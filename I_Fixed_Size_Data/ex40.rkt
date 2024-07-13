; 40.1、题目
; 使用 check-expect，引入一错误，并重新做测试

; 40.2、实现
    ; WISH LIST
    ; 时钟滴答一次，汽车移动 3 像素，从画布左侧算起，注意：使用 check-expect 引入错误,查看效果
    ; worldstae -> worldstae
    ;examples:
    ;   given : 20 , expect:23
    ;   given : 27 , expect:30
    (define (tock cw)
        (+ cw 3))

    (check-expect(tock 20) 23)
    (check-expect(tock 27) 30)
    (check-expect(tock 30) 36) ;错误的结果

; 测试二字，看上去简单，包含这里的自动测试，其实也要耗费一番力气，仅以 Racket 的 check-expect 来看，不怎么“智能”。
; 而且，我在现实中碰到过更为糟糕的状况，那就是一些开发人员，写完了代码，自己并不检查，直接丢给测试人员或者产品，导致最终的 bug 数量，多得惊人。
; 但测试是一大话题，代码大全（2）中也是至少花费了 3 章内容来讨论“测试”事宜。
; 我现在理解：程序 bug 多，不仅仅是代码质量问题，同时也是管理问题。

; 40.3、思路解析
; 这个题目看起来自然是很简单，但我第一次做，方向却歪了（见下面的代码），而是想提前把东西一次性实现了。
; 借着做题，得以看清自己的某些方面。

    ; WISH LIST
    ; 时钟滴答一次，汽车移动 3 像素，从画布左侧算起，注意：使用 check-expect 引入错误,查看效果
    ; worldstae -> worldstae
    ; 
    ; 生成背景,把车放进去
    ; number -> image 
    (define (background_space 
        (rectangle ()()"outline" "white")))

    (overlay/align)

    ; 定义移动函数, 加入 check-expect,检验错误数值

    ; (define worldsate)

    ;总结：第一次做题时的思路，可以说我是想把一切提前实现了。
