/*
pickOneElement(X,Ys,Zs) jest true gdy Zs jest listą powstałą z usunięcia
jednego wystąpienia elementu X z listy Ys
*/
pickOneElement(X, [X|Xs], Xs).
pickOneElement(X, [Y|Ys], [Y|Zs]) :-
    pickOneElement(X, Ys, Zs).

/*
permutation jest true gdy Ys jest permutacją Xs
*/
permutations([], []).
permutations([X|Xs], YsWithX) :-
    permutations(Xs, Ys),
    % pickOneElement(X, YsWithX, Ys).
    select(X, YsWithX, Ys).

/*Sumowanie ile elementów 'o wiekszym indeksie' jest mniejszych od
zadanego elementu*/
howMuchHigher([], _, Acc,Acc).
howMuchHigher([First|Tail],N, Acc,Sum) :-
    (First>N , Acc1 is Acc + 1 , howMuchHigher(Tail,N,Acc1,Sum)) ;
    (First=<N , howMuchHigher(Tail,N,Acc,Sum)) .

/*Sumowanie wszystkich nieporządków w liście*/
sumOfHigher([], _, Acc,Acc).
sumOfHigher([First|Tail], List, Acc, Sum) :-
    howMuchHigher(List, First,0,Acp) ,
    Acc1 is Acc + Acp ,
    sumOfHigher(Tail, [First|List], Acc1, Sum).

/*Lista jest permutacją parzystą gdy X=0, a nieparzystą gdy X=1 */
signOfList(List, X) :- sumOfHigher(List, [], 0, Acc),
    X is Acc mod 2.

/*
Znajdywanie listy Ys, będącej parzystą permutacją listy Xs
even_permutation jest true gdy Ys parzystą permutacją Xs
*/
even_permutation(Xs,Ys) :-
    permutations(Xs, Ys),
    signOfList(Xs, D),
    signOfList(Ys, E),
    D = E.

/*
Znajdywanie listy Ys, Będącej nieparzystą permutacją listy Xs
odd_permutation jest true gdy Ys nieparzystą permutacją Xs
*/
odd_permutation(Xs,Ys) :-
    permutations(Xs, Ys),
    signOfList(Xs, D),
    signOfList(Ys, E),
    D =\= E.




/**/
/*signOfProductOfDifferences1([], _, D, D).
signOfProductOfDifferences1([X|Xs], Y, D0, D) :-
    Y =\= X,
    D1 is (D0*(Y - Y)) // abs(Y - X),
    signOfProductOfDifferences1(Xs, Y, D1, D).


signOfProductOfDifferences([], D, D).
signOfProductOfDifferences([Y|Xs], D0, D) :-
    signOfProductOfDifferences1(Xs, Y, D0, D1),
    signOfProductOfDifferences(Xs, D1, D).
*/
