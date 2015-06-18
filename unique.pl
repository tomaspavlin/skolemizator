% unique(+Formule, -Formule) :- nahradi nazvy promennych unikatnimi nazvy
unique(F,G) :-
	find_prefix(F,x,Prefix),
	unique(F,[],0,Prefix,G,_).

% unique(+FOrmule, +SubstituceS, +SubstituceN, -Formule, -SubstituceN)
unique(F,S,N,Prefix,G,M) :-
	F =.. [A,B,C],
	kvantif(A),
	addsubstitution(B,S,N,Prefix,S2,N2),
	substitute(B,S2,B2),
	unique(C,S2,N2,Prefix,C2,M),
	G =.. [A,B2,C2],
	!.

unique(F,S,N,Prefix,G,M) :-
	compound(F),
	F =.. [A|B],
	uniqueAll(B,S,N,Prefix,B2,M),
	G =.. [A|B2],
	!.

unique(F,S,N,_,G,N) :-
	atom(F),
	substitute(F,S,G),
	!.

uniqueAll([],_,N,_,[],N).
uniqueAll([A|B],S,N,Prefix,[A2|B2],M) :-
	unique(A,S,N,Prefix,A2,N2),
	uniqueAll(B,S,N2,Prefix,B2,M).