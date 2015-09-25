test(F,Description):- 
	print('Test description: '),
	print(Description),
	print('\n'),

	print('Input:     '),
	print(F),
	print('\n'),


	pren(F,P),
	print('Pren form: '),
	print(P),
	print('\n'),


	skol(F,S),
	print('Skol form: '),
	print(S),
	print('\n'),

	print('\n').

:-
  consult(main),
  print('Testing...\n'),
  test(^ a* (^b(a)),'not'),
  test( x*p(x)/\x?q(x),'and / or'),
  test(a?b*c*d?e?f*p(a, b, c, d, e, f),'skolemization dependency'),
  test(x*p(x)/\p(x1, x_1, x__1),'name uniqueness 1'),
  test(x*y? (f1(x, y)/\f_1(x1, x_1)),'name uniqueness 2'),
  test(^ (x* (^p(x))\/p(abc)/\x?q(x))/\abc*r(abc, x),'big test').