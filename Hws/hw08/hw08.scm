(define (my-filter pred s) 
		(if (null? s)
			nil
			(if (pred (car s))
				(cons (car s) (my-filter pred (cdr s)))
				(my-filter pred (cdr s))
			)
		)
)

(define (interleave lst1 lst2) 
		(if (null? lst1)
			lst2
			(if (null? lst2)
				lst1
				(cons (car lst1) (cons (car lst2) (interleave (cdr lst1) (cdr lst2))))
			)
		)
)

;;; Scheme中的while循环也要用递归的形式完成
;;; 这题利用begin类似定义了higher order function
(define (accumulate joiner start n term)
		(begin
			(define (f cnt joiner n term total)
					(if (<= cnt n)
						(f (+ cnt 1) joiner n term (joiner total (term cnt)))
						total
					)
			)
			(f 1 joiner n term start)
		)
)

(define (no-repeats lst) 
		
)
