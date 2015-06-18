

% substitute(+Char, +SubstituteSeznam, -Char2)
substitute(A,[],A).
substitute(A,[A-B|_],B) :- !.
substitute(A,[_|S],B) :- substitute(A,S,B).

% substituteall(+CharList, +SubSeznam, -CharList2)
substitute_all([],_,[]).
substitute_all([A|As],S,[B|Bs]) :-
	substitute(A,S,B),
	substitute_all(As,S,Bs).

% addsubstitution(+Char, +Seznam, +N, +Prefix, -Seznam, -N) :- prida do seznamu substitucni pravidlo za Char,
% 	za predpokladu urciteho poctu substitucnich pravidel N
addsubstitution(C,S1,N1,Prefix,S2,N2) :-
	N2 is N1 + 1,
	atom_concat(Prefix,N2,New),
	S2 = [C-New|S1].

kvantif(forall).
kvantif(exists).

kondis(and).
kondis(or).

inv(forall,exists).
inv(exists,forall).
inv(and,or).
inv(or,and).