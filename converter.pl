:- op(100,xfy,*).
:- op(100,xfy,?).
:- op(500,yfx,/\).
:- op(500,yfx,\/).
:- op(200,fy,^).

convert(X*Y,forall(X,Z)) :- convert(Y,Z), atom(X), !.
convert(X?Y,exists(X,Z)) :- convert(Y,Z), atom(X), !.
convert(X/\Y,and(X2,Y2)) :- convert(X,X2), convert(Y,Y2), !.
convert(X\/Y,or(X2,Y2)) :- convert(X,X2), convert(Y,Y2), !.
convert(^X,not(Z)) :- convert(X,Z), !.


convert(X,X) :- nonvar(X).

tonice(X,Y) :- convert(Y,X).
fromnice(X,Y) :- convert(X,Y).


skol(X,Y) :-
	fromnice(X,X2),
	skolemization(X2,Y2),
	tonice(Y2,Y).

pren(X,Y) :-
	fromnice(X,X2),
	prenex(X2,Y2),
	tonice(Y2,Y).