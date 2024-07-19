
;4.1、实现
;这个题目看起来简单,实则未必
;正如《代码大全2》（《Code Complete, 2nd Edition》）中所讲,降低复杂度是软件开发的核心。（Conquer Complexity）


(define str "ABCDEFGHI") ;定义字符串 str,用ABCDEFGHI,是便于核对代码运行后的答案
(define natural_number 8) ; 定义要删除的数值,这里定义是 8
(define str_length (string-length str)) ; 定义字符串 str 的长度函数

(define (delete_letter natural_number) ; 定义删除字母的函数,以及要删除的数值
    (cond
        [
            (= natural_number 0) ;条件1：输入的数值是0;
              (string-append "输入的整数要小于或等于" (number->string(string-length str )))
        ]

        [
            (<= natural_number str_length) ;条件2：输入的数值,小于或等于字符串的长度
            (string-append (substring str 0 (- natural_number 1))(substring str natural_number ))
            ;这里之所以减一,是因为substring 提取字符串的元素时,是从 0 开始,而不是从 1 开始,比我们的认知始终小 1,所以减 1
        ]

        [
            (> natural_number (string-length str)) ;条件3:输入的数值,大于字符串的长度,给与对应的提示
            (string-append "输入的整数要小于或等于" (number->string(string-length str )))
        ]))

(delete_letter natural_number) ; drrackt 中运行就可以了;


;4.2、参考
(define str "hello_world")
(define i 5)
(define (string-del str i) 
(string-append (substring str 0 i ) (substring str i+1)))

;这样子处理,其实有问题,但假如定义 i = 100 ,则结果会怎么样,显然 i 的值不对。

;4.3、思路解析
;现实工作环境中,大家往往会戏称：产品一句话,代码跑断腿。这个小小的题目,便是如此。
;题目最后一句：哪些 i 的值是合法的？也就是说,这题目的重点：是需要判断 i 值是不是合理。
;所以解题的思路,重在判断判断 i 的有效值。即 i 的值,是大于字符串的长度,还是小于等于字符串的长度;
;同时使用到了 substring 来提取字符串中的字母,substing 的字符串顺序是从0开始,而不是我们认为的从1开始,所以这里需要有个转换。

;4.4、并不完美
;这个思路依然有缺陷,假如你输入了 0.5,程序会报错,但在实际使用软件时,用户有可能会输入这样的数字,
;所以上述代码还缺乏了一些必备的判断,来保证用户输入的是自然数。
;考虑到这是一个练习题,主要的宗旨还是实现出来想要的功能,所以其他的判断条件暂时未加。

