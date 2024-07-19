
; 27_28.1、题目
; 习题27.我们对示例问题的解决方案在函数中间包含几个常数。正如一个程序，多个定义已经指出的那样，最好给这些常量命名，以便将来的读者理解这些数字的来源。
; 收集DrRacket的定义区域中的所有定义并更改它们，以便将所有的数值定义为常量。

; 习题28.确定这些票价的潜在利润:1美元、2美元、3美元、4美元和5美元。哪种价格能使电影院的利润最大化?以10美分为最小单位，确定最佳的价格。

; 27_28.2、实现
;27和28题是属于一个题目，所以合在一起。
;凡变量，必名称，也即，只要有变量，就给变量一个命名。
;关于变量名称的重要程度，请参阅《代码大全（第2版）》第11章：变量名的力量。

;变量名太长，太短都不好，我个人理解，应该是做到，一看便知什么意思，变量名称开头单词尽量有差异，便于引用时鉴别。
;后面的章节马上会提到，全局常量名称，一般是用大写，定义的函数用小写，视觉上很容易区别开来。
;所以下面的定义的全局常量，都是英文大写字母。

;Constants
(define BASE_ATTENDES 120) ;基准人数
(define MARGINAL_ATTENDES 15) ;边际人数，指人数受价格影响，增加或减少的人数，这词汇来源于经济学；

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

; 27_28.3、思路解析
; 这两个题目合在一起，更容易看出问题来，题目本身不难，只是有点绕，按步骤划分开，一步步来，很容易得出什么样的价格，利润更高。
; 同时，这里也开启了函数中常量这个巨大的话题，怎么样命名，既依靠英文，也依靠经验，其实我做其他的题目，怎么样给变量命名，够头痛了。
; 这部分内容，还请详细参阅《代码大全（第2版）》第11章：变量名的力量，以及其他的章节。
