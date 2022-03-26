#lang racket

(require racket/gui)

(define string-value "") ;it store the value of the `string-input`
(define regex-value "") ;;regex value;

; compile the regex-value to `regexp` and then execute match function to find the matches ofcourse
(define (match-and-print)
  (fprintf (current-output-port) "matched-> ~a~%" (regexp-match (regexp regex-value) string-value)))

(define frame (new frame% [label "Hello"] [width 640] [height 480] [min-height 480] [min-width 640]))
(define top-regex-panel (new horizontal-panel% [parent frame] [style (list 'border)]))

(define my-input
  (new text-field%
       [parent top-regex-panel]
       [label ""]
       [style (list 'single)]
       [init-value "Inpur Regex here"]
       [callback (lambda (text event) (set! regex-value (send my-input get-value)))]))
(define exe-button
  (new button%
       [label "Execute"]
       [parent top-regex-panel]
       [callback (lambda (button event) (match-and-print))]))

(define string-input
  (new text-field%
       [parent frame]
       [label ""]
       [style (list 'multiple)]
       [init-value "String here!"]
       [callback (lambda (text evnt) (set! string-value (send string-input get-value)))]))

(send frame show #t)
