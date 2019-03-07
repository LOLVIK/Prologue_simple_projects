%Utworzenie listy L = [1,...,N]
listaOd1DoN(N,L) :- listaOd1DoN(N, [], L).

listaOd1DoN(0, Lista, Lista) :- ! .
listaOd1DoN(N, R, Lista) :- N> 0 , N2 is N-1 ,
    listaOd1DoN(N2, [N|R], Lista).

%Podwajanie listy L
doubleListaOd1DoN(N,Lista) :-
    listaOd1DoN(N,Lista1),
    append(Lista1,Lista1,Lista2),
    permutation(Lista2, Lista).

%Sprawdzanie odległości elementów od siebie w Liscie
odleglosciElementow(_,_,2,Odleglosc,Odleglosc).
odleglosciElementow(N, Lista, C, Odleglosc, Acc) :-
    Lista = [Glowa|Ogon],
    (   (N = Glowa,
         (( C = 0 , odleglosciElementow(N,Ogon,1,Odleglosc,0));
          ( C = 1 , odleglosciElementow(N,Ogon,2,Odleglosc,Acc)))) ;
        ((\+ N = Glowa) ,
         (( C = 0 , odleglosciElementow(N,Ogon,0,Odleglosc,0)) ;
          ( C = 1 , Acc2 is Acc+1, odleglosciElementow(N,Ogon,1,Odleglosc,Acc2))))).


%Czy odleglosci miedzy takimi samymi el. są parzystej wielkości
odlegloscParzysta(N,Lista) :-
    odleglosciElementow(N, Lista, 0, Odleglosc, 0),
    (Odleglosc mod 2) =:= 0.

%Czy większy element z listy występuje później niż wszystkie mniejsze
pozniejElementWiekszy(Num,[Num|_]) :- !.
pozniejElementWiekszy(Numer,Lista):- Lista = [Glowa|Ogon] , Glowa < Numer ,
    pozniejElementWiekszy(Numer,Ogon).

%Spełnione gdy:
%   dł. listy L = 2*N
%   wszystkie liczby z [1,...,N] występują na liście L 2 razy
%   między wystąpieniami tej samej liczby jest parzysta ilość liczb
%
lista(N,Lista) :-
    findall(L2, doubleListaOd1DoN(N,L2), ListaPermutacji),
    sort(ListaPermutacji, ListaPermutacjiBezDuplikatow),
    member(Lista, ListaPermutacjiBezDuplikatow),
    Lista = [1|_Ogon],
    \+ ( between(1,N,Num), \+ odlegloscParzysta(Num,Lista)),
    \+ ( between(1,N,Num2), \+ pozniejElementWiekszy(Num2,Lista)).

