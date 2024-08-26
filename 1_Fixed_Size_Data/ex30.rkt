; 30

; Constants
  (define BASE_ATTENDES 120) ;基准人数
  (define MARGINAL_ATTENDES 15) ;边际人数，指人数受价格影响，增加或减少的人数，这词汇来源于经济学

  (define CURRENT_PRICE 5) ;定义当前票价
  (define MARGINAL_PRICE 0.10) ;定义边际票价，1美元 = 100 美分，所以小数点后两位数字。

  (define PRICE_SENSITIVITY (/ MARGINAL_ATTENDES MARGINAL_PRICE)) ;定义价格敏感度。

  (define FIXED_COSTS 180) ;定义固定成本
  (define MARGINAL_COST 0.04) ;定义边际成本，1美元 = 100 美分，所以小数点后两位数字。

; functions
  (define (attendees ticket-price) ;定义到场人数
    (- BASE_ATTENDES (* (- ticket-price CURRENT_PRICE) PRICE_SENSITIVITY)))

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

; difference
(define (attendees ticket-price) ;定义到场人数函数
  (- BASE_ATTENDES (* (- ticket-price CURRENT_PRICE) (/ MARGINAL_ATTENDES MARGINAL_PRICE))))

(define (attendees ticket-price) ;定义到场人数函数
  (- BASE_ATTENDES (* (- ticket-price CURRENT_PRICE) PRICE_SENSITIVITY)))

;通过对比,可以发现，定义了价格敏感度常量，子函数相对更加容易理解，居然还可以这样子使用。