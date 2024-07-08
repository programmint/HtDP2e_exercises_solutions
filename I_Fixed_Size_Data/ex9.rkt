实现
(define in ... )
(cond
        [(string? in)(string-length in)]
        [(image? in)(* (image-width in)(image-height in))]
        [(number? in)
            (cond
                [(> in 1)(- in 1)]      
                [(= in 0) 0]
                [(< in 0) in])]
        [(boolean? in #true) 10]
        [(boolean? in #false) 20])


思路解析
英文版中有提示,去看cond的用法,中文版不知道为什么丢失了这句话,所以本题,用cond 或 if 都可以,看你的习惯.

实际应用
我之前曾碰到一个场景,从 A 系统把数据传递给 B 系统,B 系统处理数据,将结果再传递给 A 系统.
但问题是,A 系统计算结果,和 B 系统计算结果不一致,查找原因,这才发现,A 系统传递的数据,精确到小数点后两位,而 B 系统
却是取整数,所以二者的计算结果肯定不一致.

这个数据实际是财务数据,容不得半点犯错,我当时的问题是:怎么样保证数据的准确度?
当时我并不知道怎么样来处理,现在知道一点了,计算前,计算后,都要检验一下数据类型,而这就是谓词的作用.(Predicates: Know Thy Data)