(msetq $u #$diff((x+y)^6,x)$)
(defvar id 0)
(loop
		(msetq $u #$diff(u,x)$)
		(setf id (+ id 1))
		(if (eq id 4) (return))
	)