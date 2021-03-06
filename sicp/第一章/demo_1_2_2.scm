(define (fib n)
	(cond ((= n 0) 0)
	      ((= n 1) 1)
	      (else (+ (fib (- n 1))
		       (fib (- n 2))
	            )
	      )
	)
)
(define (fib2 n)
	(define (fib-iter a b count)
	        (if (= count 0)
		    b
		    (fib-iter (+ a b) a (- count 1))
	        )
	)
	(fib-iter 1 0 n)
)
;总的数目 = 
;将现金 amount 换成第一种硬币后所有*其他*硬币的不同方式数目
; + 将现金 amount-第一种硬币币值 换成*所有*种类的硬币的不同方式数目
(define (count-change amount)
	(define (first-denomination kinds-of-coins)
		(cond ((= kinds-of-coins 1) 1)
		      ((= kinds-of-coins 2) 5)
		      ((= kinds-of-coins 3) 10)
	              ((= kinds-of-coins 4) 25)
                      ((= kinds-of-coins 5) 50)
                )
         )
	(define (cc amount kinds-of-coins)
		(cond ((= amount 0) 1)
		      ((or (< amount 0) (= kinds-of-coins 0)) 0)
                       (else (+ (cc amount (- kinds-of-coins 1))
				(cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)
                             )
                        )
                )
          )
          (cc amount 5)
)
