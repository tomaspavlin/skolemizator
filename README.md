# Skolemizator
Program made in SWI-Prolog for formulas skolemization.

## Description
Skolemizator is a program for converting formulas into *Skolem normal form*. 

## Synopsis
To use the program, consult the file *main.pl*. Then you will be able to use this command:

```prolog
skol(+Formula, -FormulaInSkolemNormalForm).
```

The command above converts formula to Skolem normal form. Formula can contain the following:
- universal quantifiers *
- existential quntifiers ?
- conjunction /\
- disjunctiont \/
- negation ^
- terms

To see some examples of formulas, consult **tests.pl**.

### Other command
You can convert a formula to prenex form by typing:

```prolog
pren(+Formula, -FormulaInPrenexForm).
```

## Examples

This is an example of how *pren* and *skolem* commands work:

```prolog
?- pren( ^a* (^b(a)),X).
X = x1?b(x1).

?- skol( ^a* (^b(a)),X).
X = b(f1).

?- pren(x*p(x)/\x?q(x),X).
X = x_1*x_2? (p(x_1)/\q(x_2)).

?- skol(x*p(x)/\x?q(x),X).
X = x_1* (p(x_1)/\q(f_1(x_1))).
```

For other examples consult *tests.pl*.
