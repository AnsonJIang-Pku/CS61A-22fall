(define (cddr s) 
        (cdr (cdr s)))

(define (cadr s) 
        (car(cdr s)))

(define (caddr s) 
        (car(cddr s)))

(define (ascending? asc-lst) 
        (if (null? (cdr asc-lst))
            true
            (if (<= (car asc-lst) (cadr asc-lst))
                (ascending? (cdr asc-lst))
                false
            )
        )
)

(define (square n) (* n n))

(define (pow base exp) 
        (cond ((= base 1) 1)
              ((= exp 0)  1)
            (else (if (even? exp)
                    (square (pow base (/ exp 2)))
                    (* base (square (pow base (quotient exp 2))))
                )
            )
        )
)
