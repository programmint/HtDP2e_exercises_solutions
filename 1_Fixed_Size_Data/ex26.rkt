
; 26.1、题目
(define (string-insert s i)
  (string-append (substring s 0 i)
                 "_"
                 (substring s i)))
 
(string-insert "helloworld" 6)
; 对于下面的程序，你预估它的值是什么，使用 DrRacket 的步进器验证一下。

; 26.2、实现
(define (string-insert s i)
  (string-append (substring s 0 i)
                 "_"
                 (substring s i)))
 
(string-insert "helloworld" 6)

== ；(string-insert "helloworld" 6)
== ；(string-append (substring "helloworld" 0 6) "_" (substring "helloworld" 6))
== ；(string-append "hellow" "_" (substring "helloworld" 6))
== ；(string-append "hellow" "-" (substring "helloworld" 6))
== ；(string-append "hellow" "-" "orld")
==
"hellow_orld"

; 26.3、思路解析
; 题目依旧简单。
