;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Intervals) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; INTERVALS

; Template
; f-on-INTV: int int ->
; Purpose:
;(define (f-on0INTV low high)
;  (cond [(empty-INTV? low high)...]
;        [else high... (f-on-INTV low (sub1 high))]))
(define (empty-INTV? low high) (> low high))


(check-expect (sum-interval 10 1) 0)
(check-expect (sum-interval 10 10) 10)
(check-expect (sum-interval -1 1) 0)

; sum-interval: int int -> int
; Purpose: To sum the elements of the given INTV
(define (sum-interval low high)
  (cond [(empty-INTV? low high) 0]
        [else (+ high (sum-interval low (sub1 high)))]))


; NEW data definition fro INTV except goes from low to high rather than high to low
; f-on-INTV2: int int ->
; Purpose:
; (define (f-on-INTV2 low high)
;     (cond [(empty-INTV2? low high)...]
;           [else low... (f-on-INTV2 (add1 low) high)]))

; sum-INTV2: int int -> number
; Purpose: to sum all the elements of the given INTV2
(define (sum-INTV2 low high)
  (cond [(empty-INTV2? low high) 0]
        [else (+ low (sum-INTV2 (add1 low) high))]))
(check-expect (sum-INTV2 10 1) 0)
(check-expect (sum-INTV2 10 10) 10)
(check-expect (sum-INTV2 -1 1) 0)

; --------------------------------------------------------------------

; Recursize Auxiliary Functions

; sort: lon -> lon
; Purpose: to sort a list of numbers in non-decreasing order
(define (sort a-lon)
  ; INVENTORY
  ;
  ;
  ;
  (cond [(empty? a-lon) empty]
        [else (insert (first a-lon)(sort (rest a-lon)))]))
(check-expect (sort empty) empty)
(check-expect (sort(list 2 1 3)) (list 1 2 3))

; insert: numner lon -> lon
; Purpose: to insert a number into a lon sorted in a non-decreasing order
(define (insert a-num a-lon)
  ; INVENTORY
  ;
  ;
  ;
  (cond [(empty? a-lon) cans a-num empty]
        [else (cond [(<= a-num (first  a-lon))(cons a-num a-lon)]
                    [else (cons (first a-lon)(insert a-num (rest a-lon)))])]))
(check-expect (insert 5 empty)(list 5))
(check-expect (insert 5 (list 3 4))(list 3 4 5))
(check-expect (insert 5 (list 3 10)) (list 3 5 10))

; --------------------------------------------------------------------

; Homework

; multiply all elements in of an interval
(define (multiply-interval low high)
  (cond [(empty-INTV? low high) 0]
        [else (* high (multiply-interval low (sub1 high)))]))
(check-expect (multiply-interval 10 10) 100)
(check-expect (multiply-interval 10 1) 0)


; determine if there is a prime number in the interval
; divide each number in the interval by 2, 3, 5, 7, 11
;(define (prime? n a-lop)
 ; (cond [(empty-INTV? a-lop) 0]
  ;      [else



; #189
; search-sorted
; Number List-of-numbers -> Boolean
(define (search n alon)
  (cond
    [(empty? alon) #false]
    [else (or (= (first alon) n)
              (search n (rest alon)))]))


(define (search-sorted n a-lon)
  (cond [( empty? a-lon) #f]
        [(< n (first a-lon)) #f]
        [else (or (= (first a-lon) n)
                  (search n (rest a-lon)))]))