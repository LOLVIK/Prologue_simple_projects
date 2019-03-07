/*
Wyliczanie wartosci wariancji D dla listy liczb L.
Wariancja to średnia arytmatyczna kwadratów róznicy od ich średniej
arytmatycznej
*/

%Wyliczanie kwadratów odchylen liczb z listy
sumaKwadratowOdchylen([], _, X, X).
sumaKwadratowOdchylen(Lista,Srednia, Acc, SumaKwadratow) :-
    Lista = [First|Ogon] ,
    Acc1 is Acc + (First - Srednia)^2,
    sumaKwadratowOdchylen(Ogon, Srednia, Acc1, SumaKwadratow).

%Wyliczanie średniej arytmetycznej
suma([],X,X).
suma(Lista, Acc, Suma) :-
    Lista = [First|Ogon] ,
    Acc1 is Acc + First ,
    suma(Ogon, Acc1, Suma).
sredniaArytmetyczna(Lista, Size, Srednia) :-
    suma(Lista, 0, Suma),
    Srednia is Suma/Size.

wariancja(L, D) :-
    length(L,Size),
    sredniaArytmetyczna(L, Size, Srednia),
    sumaKwadratowOdchylen(L, Srednia, 0, SumaKwadratow),
    D is SumaKwadratow/Size.
