(defun select(l i)
                (cond 
                   ((= i 1) (car l)) 
                   (t(select (cdr l) (- i 1)))))
SELECT

CL-USER 22 : 3 > 

(select '((1 2 3 4)(2 3 4 5)(6 7 8 9)) 2)
(2 3 4 5)
CL-USER 104 : 4 > (defun selectRandom (L1)
                  (let ((a (random (+ (length L1) 1)))(b (random (+ (length L1) 1))))
                    (if (= a b) (print "error"))
                      (list (select L1  b)(select L1 a)  )))
SELECTRANDOM

CL-USER 105 : 4 > 

(selectRandom '((1 3 )(5 2 )( 4 9)))
((4 9) (5 2))

CL-USER 106 : 4 > (selectRandom '((1 3 )(5 2 )( 4 9)))

"error" 
((5 2) (5 2))

CL-USER 1 > (defun remo(L1 c)                                           
                   (let ((i 1))  
                     (loop do 
                             (setq L1 (cdr L1))                                  
                             (setq i (+ i 1)) while (<= i c))L1))
REMO

CL-USER 2 > (remo '(1 2 3 4 5) 2)
(3 4 5)

CL-USER 3 > (defun delqueue(L1)
                 (cond
                     ((= (length L1) 1 )(cdr L1) )
                     (t(cons (car L1) (delqueue (cdr L1))))))
DELQUEUE

CL-USER 4 >  (defun celems(L1 c)                                           
                   (let ((i (length L1)))  
                     (loop do 
                             (setq L1 (delqueue L1))                                  
                             (setq i (- i 1)) while (> i c))L1))
CELEMS

CL-USER 5 > (celems '(1 2 3 4) 2)
(1 2)


CL-USER 8 > (defun crossover (L1 L2 c)
                    (let ((l1 (remo L1 c))
                    (l2 (celems L1 c))
                    ( l3 (remo L2 c))
                    ( l4 (celems L2 c)))
                    (setq L11 (append l2 l3))
                    (setq L22 (append l4 l1)) (list  L11 L22) ))
CROSSOVER

CL-USER 10 > (crossover '(1 2 3 4 ) '(1 6 4 5) 2)
((1 2 4 5) (1 6 3 4))
