above_one(bicycle, pencil).
above_one(camera, butterfly).
%above_one(sth, bicycle).

left_of(butterfly, fish).
left_of(hourglass, butterfly).
left_of(pencil, hourglass).

left_of(camera, bicycle).

right_of(X,Y) :- left(Y,X).
below(X,Y) :- above(Y,X).

left(X,Y) :- left_of(X,Y).
left(X,Y) :- left_of(X,Z), left(Z,Y).

above(X,Y) :- above_one(X,Y).
above(X,Y) :- above_one(X,Z), above(Z,Y).

higher(X,Y) :- above(X,Y);
    (left(Y,Z), above(X,Z));
    (left(Z,Y),above(X,Z)).
