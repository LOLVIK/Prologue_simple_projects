ma(ala , kot).
ma(ala , mops).
ma(ola , pies).
ma(jan , ptak).
ma(tom , kon).

daje(b, ala, kot, piotr).
daje(c, ola, pies, jan).
daje(b, tom, kon, jan).
daje(c, jan, kon, piotr).
daje(d, piotr, kon, piotr).

poczatek(a).
po(a,b).
po(b,c).
po(c,d).
po(d,e).

% A < B
pozniej(A,B) :-
    po(A,B);
    (   po(A,X), pozniej(X,B)).

przed(A,B) :- po(B,A).

% A > B
wczesniej(A,B) :-
    przed(A,B); (przed(A,X), wczesniej(X,B)).

% A >= B
niePozniej(A,B) :-
    A=B;
    wczesniej(B,A).


/*
posiada(0,Kto,Co) :- ma(Kto,Co).
posiada(Kiedy,Kto,Co) :-
    daje(KiedyDostanie, _, Co, Kto), KiedyDostanie is Kiedy-1.
*/
otrzymal(Kiedy, Kto, Co) :- poczatek(Kiedy), ma(Kto,Co).
otrzymal(Kiedy, Kto, Co) :- daje(Kiedy,_,Co,Kto).

ma(Kiedy,Kto,Co) :-
    otrzymal(KiedyDostal, Kto, Co),
    niePozniej(KiedyDostal, Kiedy),
    \+((daje(KiedyOdda, Kto,Co,_),
      pozniej(KiedyOdda, Kiedy),
      pozniej(KiedyDostal,KiedyOdda))).



%ma(0,Kto,Co) :- ma(Kto,Co).
%ma(Kiedy,Kto,Co) :-
 %   (  daje(Kiedy, Ktos,Co,Kto) ,
 %   (   daje(Kiedy,Kto,Co,Komu));
 %   \+( KiedyNext is Kiedy+1, daje(KiedyNext,Kto,Co,_Komu).
%ma(Kiedy,Kto,Co) :- daje(Kiedy,_,Co,Kto).
/*
mab(Kiedy,Kto,Co) :- Kiedy2 > 0,
    \+(daje(Kiedy2,Kto,Co,_Komu),zkiedy2 < Kiedy,Kiedy3>Kiedy2, Kiedy3=<Kiedy,
      daje(Kiedy3,_Ktos,Co,Kto)).
*/
/*
    maa(Kiedy,Kto,Co) :-( Kiedy2 is Kiedy - 1 ,
    daje(Kiedy3,_,Co,Kto),
    Kiedy2 >= Kiedy3,!,
    KiedyBrakWiadomosci >= Kiedy+1,
    \+(daje(KiedyBrakWiadomosci,_,Co,_)),
    ma(Kiedy2,Kto,Co));
    \+((KiedyKoniec > Kiedy), (daje(KiedyKoniec,_,Co,Kto);
                                daje(KiedyKoniec,Kto,Co,_))).
*/
