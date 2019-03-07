isPrime(X) :- X is 2 ;
    (X > 2 , Y is round(sqrt(abs(X))) ,
    \+ (between(2,Y, Z) , (X mod Z) =:= 0)).

prime(LO, HI, N) :-
    between(LO,HI,N) ,
    isPrime(N).
