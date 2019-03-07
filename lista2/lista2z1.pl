%usuwanie elementu ostatniego listy, argumenty: lista pierwotna, lista
% skrócona
usun_ostatni([_], []).
usun_ostatni([X|Ogon1], [X|Ogon2]) :- usun_ostatni(Ogon1, Ogon2).

%usuwanie pierwszego elementu listy
usun_pierwszy(L1, L2) :- L1 = [_X|L2].

%wyznaczanie środkowego elementu, argumenty: lista, środkowy element
srodkowy(L,X) :- L=[X].
srodkowy(L,X) :- usun_ostatni(L,L2) , usun_pierwszy(L2,L3), srodkowy(L3,X).
