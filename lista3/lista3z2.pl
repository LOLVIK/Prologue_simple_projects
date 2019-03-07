/*
Okreslenie predykatu max_sum(L,S), który dla listy L, znajduje max
wartość S, wśród wszystkich sum po wszystkich możliwych sekcjach
*/

%Ciąg kolejnych liczb o największej sumie
maxSum([], _, MaxSum, MaxSum).
maxSum([First|Ogon], Acc, MaxSumAcc, Max) :-
    Acc1 is Acc + First ,
    (  (Acc1 < 0 ,
          maxSum(Ogon, 0, MaxSumAcc, Max));
       (Acc1 >= 0 ,
        (  (Acc1 >= MaxSumAcc, maxSum(Ogon, Acc1, Acc1, Max) ) ;
           (Acc1 <  MaxSumAcc, maxSum(Ogon, Acc1, MaxSumAcc, Max) )))
    ).



max_sum([],0).
max_sum(L, S) :-
    maxSum(L, 0, 0, S).
