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

le_tran :- \+ (le(X,Y) , le(Y,Z), \+ le(X,Z)).
le_anty_sym :- \+ (le(X,Y) , le(Y,X), \+ X == Y).
le_rev :- \+ ((le(X,_) ; le(_,X)) , \+ le(X,X)).

czesciowy_porzadek :-
   le_tran ,
   le_anty_sym,
   le_rev.

