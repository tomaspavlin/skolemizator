# Skolemizator
Program made in SWI-Prolog for formulas skolemization.

## Description
Skolemizator is a program for converting formulas into *Skolem normal form*. 

## Synopsis
To use the program, consult the file *main.pl*. Then you will be able to use this command:

```prolog
skolemization(+Formula, -FormulaInSkolemNormalForm).
```

The command above converts formula to Skolem normal form. Formula can contain following:
- universal quantifiers *forall(xxx,Subformula)*
- existential quntifiers *exists(xxx,Subformula)*
- conjunction *and(Subformula,Subformula)*
- disjunctiont *or(Subformula,Subformula)*
- negation *not(Subformula)*

### Other command
You can convert formula to prenex form by typing:

```prolog
prenex(+Formula, -FormulaInPrenexForm).
```

## Examples

This is example of how *prenex* and *skolemization* commands work:

```prolog
?- prenex(not(forall(a,not(b(a)))),X).
X = exists(x1, b(x1)).

?- skolemization(not(forall(a,not(b(a)))),X).
X = b(f1).

?- prenex(and(forall(x,p(x)),exists(x,q(x))),X).
X = forall(x_1, exists(x_2, and(p(x_1), q(x_2)))).

?- skolemization(and(forall(x,p(x)),exists(x,q(x))),X).
X = forall(x_1, and(p(x_1), q(f_1(x_1)))).
```

There are more sophicticated examples in the file *examples.txt*.