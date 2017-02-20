(msetq $u #$diff((x+y)^6,x)$)
(defvar id 0)
(defun diffn(ex n)
	(msetq $v ex)
	(loop
		(msetq $v #$diff(v,x)$)
		(setf id (+ id 1))
		(if (eq id n) (return $v))
	)
)
;(diffn $u 4)
(msetq $w #$diff((x+y)^8,x)$)
;(diffn $w 4)
(defun diffn1(ex n)
	(msetq $v ex)
	(loop
		(msetq $v #$diff(v,x)$)
		(setf id (+ id 1))
		(if (eq id n) (return $v))
	)
)
#$w1: diff(u,x)$
;(print $w1)
#$stringout("malisp.out",w1)$
#$block(w2,w2: diff(w,x), w3: diff(u,x))$
#$w2;$
#$print(w2,w3)$
#$stringout("malisp1.out",w2,w3)$