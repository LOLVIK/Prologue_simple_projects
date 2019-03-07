/*
Gerowanie tablicy z wstawionymi symbolami znaków działań, elementy
pierwotnej tablicy umieszczone są w odwrotnej kolejności :
Wynik = [an,znak(n-1),...,a3,znak(2),a2,znak(1),a1]
*/
wstawianie_znakow(Lista, ListaZeZnakami) :- wstawianie_znakow(Lista,[],ListaZeZnakami).
wstawianie_znakow([], ListaZeZnakami, ListaZeZnakami).
wstawianie_znakow([Glowa|Lista], Acc, Wynik) :-
    Laczenia = [Glowa|Acc] ,
    ((  \+ (Lista = []),
        (   wstawianie_znakow(Lista, [+|Laczenia], Wynik);
            wstawianie_znakow(Lista, [-|Laczenia], Wynik);
	    wstawianie_znakow(Lista, [*|Laczenia], Wynik);
	    wstawianie_znakow(Lista, [/|Laczenia], Wynik))) ;
     (   Lista = [] , wstawianie_znakow(Lista, Laczenia, Wynik))).

odwracanie_listy(Lista, ListaRev) :- odwracanie_listy(Lista, [], ListaRev).
odwracanie_listy([], ListaRev, ListaRev).
odwracanie_listy([Glowa|Lista], Acc, ListaRev) :-
    odwracanie_listy(Lista, [Glowa|Acc], ListaRev).

podlista(Lista, X, Podlista, Y) :-
    append( [X,Podlista,Y], Lista) ,
    length(Podlista,Dlugosc) , Dlugosc >= 3,
    Podlista = [Glowa|_] , number(Glowa),
    last(Podlista, Ostatni) , number(Ostatni).

nawiasy(Lista, ListaZNawiasami) :-
    podlista(Lista,Start,Mid,End) ,
    MidN = ['('|Mid] , EndN = [')'|End] ,
    append([Start,MidN,EndN], ListaZNawiasami).
wstawianie_nawiasow(Lista,Rozmiar,Out) :-
    Rozmiar >1 , N is Rozmiar -1 , wstawianie_nawiasow(Lista,N,Out).
wstawianie_nawiasow(Lista,N, Out) :- N > 0, nawiasy(Lista,Out).

nie_dziel_przez_zero(Dzialania) :- \+ dziel_przez_zero(Dzialania).

dziel_przez_zero(Dzialania) :-
    podlista(Dzialania,_,'/',L) , L = [H|_] ,
    (   (number(H) ,( abs(H) < 0.00000000001 ) ) ;
        (\+ number(H) , podlista(L,_,['(',Exp],[')'|_]),
         term_to_atom(Ex,Exp) , 0.00000000001 > abs(Ex))).

wyrazenie([], _, _) :- false.
wyrazenie(Lista, Wartosc, Wyrazenie) :-
    wstawianie_znakow(Lista, ListaZeZnakami),
    odwracanie_listy(ListaZeZnakami, ListaZeZnakamiRev),
    length(Lista, Rozmiar),
    ((   ListaZNawiasami = ListaZeZnakamiRev ) ;
     (   wstawianie_nawiasow(ListaZeZnakamiRev, Rozmiar, ListaZNawiasami))),
    atomic_list_concat(ListaZNawiasami, Dzialania),
    nie_dziel_przez_zero(Dzialania),
    term_to_atom(Wyrazenie, Dzialania),
    Wartosc is Wyrazenie, !.
