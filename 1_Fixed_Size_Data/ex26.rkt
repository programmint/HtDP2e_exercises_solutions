; 26

(define (string-insert s i)
  (string-append (substring s 0 i)
                "_"
                (substring s i)))
  
  (string-insert "helloworld" 6)

  == ;(string-insert "helloworld" 6)
  == ;(string-append (substring "helloworld" 0 6) "_" (substring "helloworld" 6))
  == ;(string-append "hellow" "_" (substring "helloworld" 6))
  == ;(string-append "hellow" "-" (substring "helloworld" 6))
  == ;(string-append "hellow" "-" "orld")
  ==
  "hellow_orld"
