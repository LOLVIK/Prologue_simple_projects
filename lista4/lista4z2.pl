/*
Zagadka Einsteina
W 5 domach, o 5 różnych kolorach, mieszkają ludzie 5 różnych
narodowości, każdy z nich pali papierosy 5 różnych marek i piją 5
różnych napojów. Hodują 5 różnych gatunków zwierząt.
Który z nich trzyma w domu rybki?
*/
/*Elementami zmiennej Domy są zależności poszczególnych domów o składzie:
[nr domu, jaki kolor, kto mieszka, co pali, co pije, jakie ma zwierze]
*/
zagadka_Einsteina(Domy) :-
    Domy = [[1,_,_,_,_,_], [2,_,_,_,_,_], [3,_,_,_,_,_], [4,_,_,_,_,_], [5,_,_,_,_,_]],
    member([1,_,norweg,_,_,_],Domy),
    member([Nr6,_,norweg,_,_,_],Domy), member([Nr7,niebieski,_,_,_,_],Domy),
    (   Nr7 is Nr6 + 1),
    member([_,czerwony,anglik,_,_,_],Domy),
    member([Nr1,zielony,_,_,_,_],Domy), member([Nr2,bialy,_,_,_,_],Domy),
    (   Nr1 is Nr2 - 1),
    member([_,_,dunczyk,_,herbata,_],Domy),
    member([Nr3,_,_,light,_,_],Domy), member([Nr4,_,_,_,_,koty],Domy),
    (   Nr3 is Nr4 - 1 ; Nr3 is Nr4 + 1),
    member([_,zolty,_,cygara,_,_],Domy),
    member([_,_,niemiec,fajka,_,_],Domy),
    member([3,_,_,_,mleko,_],Domy),
    member([Nr5,_,_,_,woda,_],Domy),
    (   Nr5 is Nr3 - 1 ; Nr5 is Nr3 + 1),
    member([_,_,_,papierosy_bez_filtra,_,ptaki],Domy),
    member([_,_,szwed,_,_,psy],Domy),
    /*member([Nr6,_,norweg,_,_,_],Domy), member([Nr7,niebieski,_,_,_,_],Domy),
    (   Nr7 is Nr6 + 1),*/
    member([Nr8,_,_,_,_,konie],Domy), member([Nr9,zolty,_,_,_,_],Domy),
    (   Nr8 is Nr9 - 1 ; Nr8 is Nr9 + 1),
    member([_,_,_,mentolowe,piwo,_],Domy),
    member([_,zielony,_,_,kawa,_],Domy).

%Kto hoduje rybki
rybki(Kto) :-
    zagadka_Einsteina(Domy), member([_,_,Kto,_,_,rybki], Domy) , !.
