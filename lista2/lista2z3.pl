arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).


helper(X,Y,List) :- member(X,List) , member(Y,List).
helper(X,Y,List) :- member(Node,List) ,
    arc(Node,ReachableNode) ,
    \+ member(ReachableNode,List) ,
    helper(X,Y,[ReachableNode|List]).

osiagalny(X,Y) :-
    helper(X,Y,[X]).
