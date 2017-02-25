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
;#$stringout("malisp.txt",w1)$
#$block(w2,w2: diff(w,x), w3: diff(u,x))$
#$w2;$
#$print(w2,w3)$
;#$stringout("malisp1.txt",w2,w3)$
#$(x: 24,y: 24)$
#$(w4(x,y):=(x+y)^6 , w5(x,y):=(x+y)^8)$
#$print(w4(x,y),w5(x,y))$
#$(w6(x,y):=(x+y) , w7(x,y):=(x+y)^2)$
#$print(genfact(x,x,1))$
#$print(genfact(w6(x,y),w6(x,y)/2,2))$
#$(w8: (gensym(1234))^6)$
#$print(w8)$
#$(x1: 1236)$
#$(w9: (gensym(x1))^6)$
#$print(w9)$
#$(load (functs))$
#$(w10: harmonic(1,2,3,4))$
#$print(w10)$
#$(h[i,j]:= harmonic(i,j,3,4))$
#$print(genmatrix(h,3,3))$
#$(errcatch(load (descriptive)))$
#$(errcatch(load (descriptive)))$
;#$(load (descriptive))$
#$(s1: read_list(file_search("wind.data")))$
#$(w11: harmonic_mean(s1))$
#$print(w11)$
#$(s2: read_matrix(file_search("wind.data")))$
#$(w12: harmonic_mean(s2))$
#$print(w12)$

