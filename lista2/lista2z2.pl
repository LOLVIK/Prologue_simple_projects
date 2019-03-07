ilosc(L,X,N) :- ilosc(L,X,0,N).
ilosc([],_X,A,A).
ilosc(L,X,A,N) :- L=[Y|L2],
    ((X=Y , A2 is A + 1 , ilosc(L2,X,A2,N)) ; ((\+ X=Y) , ilosc(L2,X,A,N))).

%jednokrotne wystąpienie elementu X w liście L
jednokrotnie(X,L) :-
    member(X,L) ,
    ilosc(L,X,1) .

%dwukrotne wystąpienie elementu X w liście L
dwukrotnie(X,L) :-
   member(X,L) ,
    ilosc(L,X,2) .
   % member(X,L).

%2-krotne wystąpienie el. X w liście L (z posortowaniem)
dwukrotnieSort(X,L) :-
    msort(L,LS) ,
    nextto(A,X,LS),
    ilosc(LS,X,2) ,
    A=X.
