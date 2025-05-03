filepath: /home/gambled/Codes/prolog/Practica10.pl

pertenece(X, Lista):-
    member(X, Lista).




num_elem(Lista, N):-
    length(Lista, N).




es_ultimo(X, Lista):-
    last(Lista, X).