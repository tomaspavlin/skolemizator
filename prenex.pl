% prenex(+Formule, -FormuleVPrenexnimTvaru).

prenex(X,Y) :-
	unique(X,X2),
	prenex2(X2,Y).

% prenex2(+FormuleUnique, -FormuleVPrenex)

% not(not(...))
prenex2(not(not(X)),Y) :-
	prenex2(X,Y),
	!.

% kondis("kvant",..)
prenex2(X,Y) :- 
	X =.. [Kondis,A,B],
	kondis(Kondis),
	prenex2(A,A2),
	A2 =.. [Kvant,Q,C],
	kvantif(Kvant),
	D =.. [Kondis,B,C],
	Y0 =.. [Kvant,Q,D],
	prenex2(Y0,Y),
	!.

% kondis(..,"kvant")
prenex2(X,Y) :- 
	X =.. [Kondis,B,A],
	kondis(Kondis),
	prenex2(A,A2),
	A2 =.. [Kvant,Q,C],
	kvantif(Kvant),
	D =.. [Kondis,B,C],
	Y0 =.. [Kvant,Q,D],
	prenex2(Y0,Y),
	!.

% kvant(...)
prenex2(X,Y) :-
	X =.. [Kvant,Q,A],
	kvantif(Kvant),
	prenex2(A,B),
	Y =.. [Kvant,Q,B],
	!.

% not(...)
prenex2(X,Y) :-
	X =.. [not,A],
	prenex2(A,A2),
	A2 =.. [Kvant,Q,B],
	kvantif(Kvant),
	inv(Kvant,IKvant),
	Y0 =.. [IKvant,Q,not(B)],
	prenex2(Y0,Y),
	!.

% compound(...)
prenex2(X, X) :- 
	compound(X),
	!.

% atom
prenex2(X, X) :- % ....
	atom(X),
	!.