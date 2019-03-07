le(1,1).
le(1,2).
le(1,3).
le(1,4).
le(1,5).
le(2,2).
le(2,3).
le(2,4).
le(2,5).
le(3,3).
le(3,4).
le(3,5).
le(4,4).
le(4,5).
le(5,5).
le(-1,-1).

le_tran(X,Y) :- le(X,Y); (le(X,Z), le_tran(Z,Y)).
le_anty_sym(X,Y) :- le_tran(Y,X), X == Y.

maksymalny(X) :- le(X,X), \+ (le(X,Y), X=\=Y) .

minimalny(X) :- le(X,X), \+ (le(Y,X), X=\=Y).

najwiekszy(X) :- le(X,X),  \+ ( le(Y,Y) , \+ le(Y,X)).
% (between(1,5,Y),Y=\=0), (forall(Y=<X, le(Y,X))).

najmniejszy(X) :- le(X,X), \+ ( le(Y,Y) , \+ le(X,Y)).
