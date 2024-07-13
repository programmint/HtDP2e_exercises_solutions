
; 31.1、题目
; 这题目太长，我就不引用了，请参阅

; 31.2、实现
(define (letter fst lst signature-name)
  (string-append
    (opening fst)
    "\n\n"
    (body fst lst)
    "\n\n"
    (closing signature-name)))
 
(define (opening fst)
  (string-append "Dear " fst ","))
 
(define (body fst lst)
  (string-append
   "We have discovered that all people with the" "\n"
   "last name " lst " have won our lottery. So, " "\n"
   fst ", " "hurry and pick up your prize."))
 
(define (closing signature-name)
  (string-append
   "Sincerely,"
   "\n\n"
   signature-name
   "\n"))


(define (main in-fst in-lst in-signature out)
  (write-file out
              (letter (read-file in-fst)
                      (read-file in-lst)
                      (read-file in-signature))))

(write-file "in-first.dat" "Matt")
(write-file "in-last.dat" "Johnson")
(write-file "in-sig.dat" "Edward")

(main "in-first.dat" "in-last.dat" "in-sig.dat"  "letter.dat")

(read-file "letter.dat")

; 31.3、思路解析
; 这个题目其实有点唬人，核心就是考验刚刚所学的 write-file 和 read-file，注意 out 这个参数，不必另行给定一个实际的参数， out 是 write-file 用后面 letter 函数创建的。
; 该书的题目，大多都有一共同点，就是需要识破题目的真正点，到底是什么。这一点，确实像产品设计，市场真正所需，不会明明白白告诉你，得需要你自己挖出来。

