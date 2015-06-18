# Skolemizator
Program in SWI-Prolog for formulas skolemization.

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

```
?- prenex(not(forall(a,not(b(a)))),X).
X = exists(x1, b(x1)).

?- skolemization(not(forall(a,not(b(a)))),X).
X = b(f1).
```

There are more examples in the file *examples.txt*.