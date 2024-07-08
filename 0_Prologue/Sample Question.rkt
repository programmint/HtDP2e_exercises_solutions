;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Sample Question|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")) #f)))


;文中提到的一个例子,作者在这里悄无声息设下陷阱：

(and (or (= (string-length "hello world")
            (string->number "11"))
         (string=? "hello world" "good morning"))
     (>= (+ (string-length "hello world") 60) 80))

;第5页的这个示例,可能会阻碍你一下,其实这就是这本书的风格;
;string=? 到底是什么意思？书里并没有明确讲,而是叫你去查;

;这个题目确实像只拦路虎,把我截停在这里,其实这是本书的一个特色,逼着你学会“自我探索”。
;自己有一点 python 基础,所以根本就没有注意到题目前段话,如下：

;停一下！尝试以下 3 个表达式：(>= 10 10)、(<= -1 0）和（string=? "design" ＂tinker＂）。最后一个又有所不同,但不要担心,可以做到的。

;这段话风轻云淡,唯恐引起你注意,叫你尝试,如果没有尝试,那么这个示例题,确实能挡住你。
;也直接输入这几行代码,看 IDE的提示,问题又来了,结果可以死记硬背,真正理解了吗？

;无奈只能去搜。
;DrRacket 中,点击“Help”,然后再点击“Help”,会打开你的默认浏览器,搜索 string=?,然后点击第一个结果;
;你就发现,string=?  的意义很简单,就是比较两个字符串,是不是完全一致。（注意,racket 区分大小写）
;这个题目并不难,但通过这个题目,可以助你建立一个好习惯：主动探索。

;我会附加一笔记,以截图的形式,会更加直观;














