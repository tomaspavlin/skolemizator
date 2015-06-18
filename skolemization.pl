% skolemization(+Formule, -SkolemizovanaFormule) :- prevede formuli do
% 	prenexniho tvaru jen s univerzalnimi kvantifikatory
skolemization(F,G) :-
	prenex(F,F2),
	skolemization2(F2,G).

% skolemization2(+FormuleVPrenex, -SkolemF) :- skolemizuje formuli v prenex tvaru
skolemization2(F,G) :-
	find_prefix(F,f,Prefix),
	skolemization2(F,[],[],Prefix,G).

% skolemization2(+FormuleVPrenex, +DependenciesList, +Substitutions, +FunctionPrefix, -SkolemF) :-
%	skolemizuje formuli s pouzitim zavislosi a substituci

skolemization2(forall(Q,F),Ds,Ss,Prefix, G) :-
	Ds2 = [Q|Ds],
	skolemization2(F,Ds2,Ss,Prefix,F2),
	G = forall(Q,F2),
	!.

skolemization2(exists(Q,F),Ds,Ss,Prefix,G) :- 
	addrule(Q,Ds,Ss,Prefix,Ss2),
	skolemization2(F,Ds,Ss2,Prefix,G),
	!.

skolemization2(F,Ds,Ss,Prefix,G) :-
	compound(F),
	F =.. [Func|S],
	skolemization2_all(S,Ds,Ss,Prefix,S2),
	G =.. [Func|S2],
	!.

skolemization2(F,_,Ss,_,G) :-
	atom(F),

	%G = Ss,
	substitute(F,Ss,G),
	!.

% skolemizuje seznam
skolemization2_all([],_,_,_,[]).
skolemization2_all([A|As],Ds,Ss,Prefix,[B|Bs]) :-
	skolemization2(A,Ds,Ss,Prefix,B),
	skolemization2_all(As,Ds,Ss,Prefix,Bs). 



% addrule(+Q,+Dependencies,+SubstitutionList, -SubstitutionList2)
addrule(Q,Ds,Ss,Prefix,Ss2) :-
	length(Ss,L),
	L2 is L + 1,
	atom_concat(Prefix,L2,Func),
	Rep =.. [Func|Ds],
	Ss2 = [Q-Rep|Ss].