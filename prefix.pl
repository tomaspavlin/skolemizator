% find_prefix(+Formule, +IdealniPrefix, -VolnyPrefix) :- Vrati IdealniPrefix pokud se nazev niceho ve formuli takovy prefix nema. Pokud ma, vrati jiny podobny nekonfliktni (s formuli) prefix.
find_prefix(F, P, P) :- free_prefix(F,P), !.

find_prefix(F, P1, R) :-
	atom_concat(P1,'_',P2),
	find_prefix(F, P2, R).

% free_prefix(+Formule, +Prefix) :- Ve formuli neexistuje nazev promenne nebo funktor zacinajici na Prefix
free_prefix(F, P) :-
	F =.. [A|As],
	not_prefix(P,A),
	free_prefix_all(As,P).

% free_prefix_all(+As,+P) :- P neni je volny prefix v kazde formuli z As
free_prefix_all([],_).
free_prefix_all([A|As],P) :-
	free_prefix(A,P),
	free_prefix_all(As,P).

% not_prefix(+Prefix, +Nazev) :- Prefix neni prefixem nazvu
not_prefix(P,N) :-
	name(P,A),
	name(N,B),
	not_list_prefix(A,B).

% not_list_prefix(+PrefixS, +NazevS)
not_list_prefix([_|_],[]).
not_list_prefix([A|_],[B|_]) :- A \= B, !.
not_list_prefix([_|A],[_|B]) :- not_list_prefix(A,B), !.