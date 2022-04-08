Write a PROLOG program that implements a family database for your family. Save it as an ordinary 
text file named family.pl.
Your program should implement the following facts for your immediate family, grandparents, and 
great-grandparents.
parent_of(X,Y).
male(X).
female(Y).

female(tash).
female(kay).
female(anbal).
male(roshaun).
male(leigh).
male(west).
father(kay,leigh).
father(roshaun,leigh).
father(tash,west).
mother(kay,anbal).
mother(roshaun,anbal).
mother(tash,anbal).
parent(X,Y):-father(X,Y),father(S,Y),mother(X,Y),mother(S,Y).

sister(X,Y):-mother(U,X),mother(U,Y),female(X).

brother(X,Y):-mother(U,X),mother(U,Y),male(X).
