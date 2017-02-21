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
#$stringout("malisp.txt",w1)$
#$block(w2,w2: diff(w,x), w3: diff(u,x))$
#$w2;$
#$print(w2,w3)$
#$stringout("malisp1.txt",w2,w3)$
#$(x: 24,y: 24)$
#$(w4(x,y):=(x+y)^6 , w5(x,y):=(x+y)^8)$
#$print(w4(x,y),w5(x,y))$
#$(w6(x,y):=(x+y) , w7(x,y):=(x+y)^2)$
#$print(genfact(x,x,1))$
#$print(genfact(w6(x,y),w6(x,y)/2,2))$