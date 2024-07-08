;27和28题是属于一个题目，所以合在一起。
;凡变量，必名称，也即，只要有变量，就给变量一个命名。
;关于变量名称的重要程度，请参阅《代码大全（第2版）》第11章：变量名的力量。

;变量名太长，太短都不好，我个人理解，应该是做到，一看便知什么意思，变量名称开头单词尽量有差异，便于引用时鉴别。
;后面的章节马上会提到，全局常量名称，一般是用大写，定义的函数用小写，视觉上很容易区别开来。
;所以下面的定义的全局常量，都是英文大写字母。

;Constants
(define BASE_ATTENDES 120) ;基准人数
(define MARGINAL_ATTENDES 15) ;边际人数，指人数受价格影响，增加或减少的人数，这词汇来源于经济学;

(define CURRENT_PRICE 5) ;定义当前票价
(define MARGINAL_PRICE 0.10) ;定义边际票价，1美元 = 100 美分，所以小数点后两位数字。

(define FIXED_COSTS 180) ;定义固定成本
(define MARGINAL_COST 0.04) ;定义边际成本，1美元 = 100 美分，所以小数点后两位数字。


;functions
(define (attendees ticket-price) ;定义到场人数
  (- BASE_ATTENDES (* (- ticket-price CURRENT_PRICE) (/ MARGINAL_ATTENDES MARGINAL_PRICE))))

(define (revenue ticket-price) ;定义收入
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price) ;定义成本
  (+ FIXED_COSTS (* MARGINAL_COST (attendees ticket-price))))

(define (profit ticket-price) ;定义利润（收入 - 成本）
  (- (revenue ticket-price)
     (cost ticket-price)))

;examples
(profit 1.0) ;511.2
(profit 2.0);937.2
(profit 3.0);1063.2 显然3美元是最佳价格
(profit 4.0);889.2
(profit 5.0);415.2