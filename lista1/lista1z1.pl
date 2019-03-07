ojciec(zbyszek, kasia).
ojciec(zbyszek, aneta).
ojciec(zbyszek, julia).
ojciec(jan, zbyszek).
ojciec(jan, wiola).
ojciec(jozef, ewa).
ojciec(jozef, janusz).

matka(ewa, kasia).
matka(ewa, aneta).
matka(ewa, julia).
matka(celina, zbyszek).
matka(celina, wiola).
matka(rozalia, ewa).
matka(rozalia, janusz).

mezczyzna(zbyszek).
mezczyzna(jan).
mezczyzna(jozef).
mezczyzna(janusz).

kobieta(kasia).
kobieta(aneta).
kobieta(julia).
kobieta(ewa).
kobieta(celina).
kobieta(rozalia).
kobieta(wiola).

rodzic(X, Y) :- matka(X,Y) ; ojciec(X, Y).

diff(X, Y) :-
    X \= Y.

jest_matka(X) :- matka(X, _).

jest_ojcem(X) :- ojciec(X,_).

jest_synem(X) :- mezczyzna(X) , rodzic(_, X).

siostra(X, Y) :- kobieta(X),
    rodzenstwo(X, Y).

dziadek(X, Y) :- ojciec(X, Z), ojciec(Z, Y).

rodzenstwo(X, Y) :- rodzic(Z, X) , rodzic(Z, Y),
    diff(X, Y),
    X @=< Y.
