; 29

; Constants
  (define BASE_ATTENDES 120) ;基准人数
  (define MARGINAL_ATTENDES 15) ;边际人数，指人数受价格影响，增加或减少的人数，这词汇来源于经济学

  (define CURRENT_PRICE 5) ;定义当前票价
  (define MARGINAL_PRICE 0.10) ;定义边际票价，1美元 = 100 美分，所以小数点后两位数字。

  (define FIXED_COSTS 0) 
    ; 定义固定成本为 0 ，因为是顺接上面的题目，所以保留了这个值，好处是不会改动下面的函数
    ; 但糟糕的地方，就是莫名其妙多了一个毫无意义的变量。
    ; 我这里倾向于保留这个变量，万一后面又有了变化，例如要增加固定成本呢
    ; 假如这个题目，是单独的一题目，那么这个无意义的变量，则不必要存在
    ; 这里也反应了程序设计的一个特点，要理解需求。这个话题，老生常谈，又争议不断。

  (define MARGINAL_COST 1.50)
    ;定义边际成本，1美元 = 100 美分，所以小数点后两位数字。

; functions
  (define (attendees ticket-price) ;定义到场人数
    (- BASE_ATTENDES (* (- ticket-price CURRENT_PRICE) (/ MARGINAL_ATTENDES MARGINAL_PRICE))))

  (define (revenue ticket-price) ;定义收入
    (* ticket-price (attendees ticket-price)))

  (define (cost ticket-price) ;定义成本
    (+ FIXED_COSTS (* MARGINAL_COST (attendees ticket-price))))

  (define (profit ticket-price) ;定义利润（收入 - 成本）
    (- (revenue ticket-price)
      (cost ticket-price)))

; examples
  (profit 3.0) ; 630
  (profit 4.0) ; 675 ，4美元是最佳价格
  (profit 5.0) ; 420