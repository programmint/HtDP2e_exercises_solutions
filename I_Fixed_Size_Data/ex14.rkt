实现
(define (string-last x)
    (if(>=(string-length x) 1)
        (substring x(- (string-length x) 1)(string-length x))
        "请至少输入一个字母或数字"))

 (string-last "abc")
思路
14题和13题的思路一致,不多述。