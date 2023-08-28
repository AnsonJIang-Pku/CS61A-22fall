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

;;; 判断x是否在lst中
(define (helper lst x)
	(if (null? lst)
		#f
		(if (= (car lst) x)
			#t
			(helper (cdr lst) x))
		)
)

(define (no-repeats lst) 
	(begin
		(define (f res ls)
			(if (null? ls)
				res
				(if (null? res)
					(f (list (car ls)) (cdr lst))
					(if (helper res (car ls))
						(f res (cdr ls))
						(f (append res (list (car ls))) (cdr ls))
					)
				)
			)
		)
		(f nil lst)
	)
)
