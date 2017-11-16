;Liam Dungan - CS314 - HW4 - Oct. 10,2017


#|
Problem 1

Define (i.e. write) the function (echo lst). This function doubles each top-level element of list
lst. E.g., (echo '(a b c)) returns (a a b b c c). (echo '(a (b c))) returns (a a (b c) (b c))
|#

(define (echo lst)
  (if (null? lst) '() (cons (car lst)
                            (cons (car lst) (echo (cdr lst))))))



#|
Problem 2

Define the function (echo-lots lst n). (echo-lots '(a (b c)) 3) returns (a a a (b c) (b c) (b c)), that
is, it is like echo but it repeats each element of lst n times.
|#

(define (echo-item item n)
  (if (= n 0) '()
      (cons item (echo-item item (- n 1)))))

(define (echo-lots lst n)
  (cond ((null? lst) '())
        ((= n 0) '())
        (else (cons (echo-item (car lst) n) (echo-lots (cdr lst) n)))))



#|
Problem 3

Define the function (echo-all lst) which is a deep version of echo. (echo-all '(a (b c)) should
return (a a (b b c c)(b b c c)).
|#
(define (echo-all lst)
  (cond ((null? lst) '())
        ((not (pair? lst)) lst)
        (else (cons (echo-all (car lst))
                    (cons (echo-all (car lst)) (echo-all (cdr lst)))))))
        


#|
Problem 4

Define the function nth. (nth i lst) returns the ith element of lst. E.g., (nth 0 '(a b c)) returns a,
and (nth 1 '(a (b c) d) returns (b c). You may assume that 0 ≤ i < (length lst). You may not use
the functions list-tail or list-ref in defining nth.
|#
(define (nth i lst)
  (cond ((null? lst) '())
        ((> i 0) (nth (- i 1) (cdr lst)))
        ((= i 0) (car lst))))


#|
Problem 5

Define a scheme function (assoc-all keys a-list) where keys is a list of symbols and a-list is an
assoc-list. (An assoc-list is a list ((<key1> <value1>)(<key2> <value2>) ...) whose elements
are two-element lists (<keyi> <valuei>), whose first element is a key and whose second element
is the associated value.) assoc-all returns a list of the data associated with elements of keys by
a-list. E.g. (assoc-all '(a d c d) '((a apple)(b boy)(c (cat cow))(d dog))) returns (apple dog (cat
cow) dog). Use map. Note that you can't simply use assoc as one of the arguments to map; you
need to use a lambda expression.
|#
(define (assoc-all keys a-list)
  (cond ((or (null? keys) (null? a-list)) '())
        (else (map (lambda (x) (cadr (assoc x a-list))) keys))))



#|
Problem 6

Define a scheme function filter which takes two arguments: a function fn and a list lst. Filter
should return a list consisting of those elements of lst for which the fn returns true. E.g., the
value of (filter even? '(3 4 6 7 8)) should be (4 6 8)) (The function even? is a built-in function
in scheme which returns #t if its argument is even and #f if odd.)
|#
(define (filter fn list) 
 (cond ((null? list) '())
       ((fn (car list)) (cons (car list) (filter fn (cdr list))))
       (else (filter fn (cdr list)))))



#|
Problem 7

Define a scheme function (filter-out-er fn) which returns a function of one argument. This
argument must be a list, and the function returned must filter that list using (not fn) as its filter.
E.g., ((filter-out-er even?) '(3 4 6 7 8) should return (3 7).
|#
(define (filter-out-er fn)
  (letrec ((notfilter (lambda (fn list) 
 (cond ((null? list) '())
       ((not (fn (car list))) (cons (car list) (notfilter fn (cdr list))))
       (else (notfilter fn (cdr list))))))) (lambda (list) (notfilter fn list))))

