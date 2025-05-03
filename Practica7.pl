% filepath: /home/gambled/Codes/prolog/Practica7.pl

a(X):- b(X).
a(X):- f(X).
b(X):- g(X), !, v(X).
b(X):- X=4, v(X).
g(1).
g(2).
g(3).
v(_).
f(5).


