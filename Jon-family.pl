% Write a PROLOG program that implements a family database for your family. 
% Save it as an ordinary text file named family.pl.
% Your program should implement the following facts for your:
% immediate family, grandparents, and  great-grandparents.

% Online compiler https://swish.swi-prolog.org/

% Gender declarations
male(_X).
male(banca).
male(phil).
male(jon).
male(baldwin).
male(williamsr).
male(williamjr).
male(darlston).

female(_Y).
female(suzette).
female(jefferine).
female(charlene).
female(leonie).
female(zxvana).
female(zxrai).
female(lacey).
female(tile).

% Parent declarations
parent_of(_X, _Y).
parent_of(charlene, jon).
parent_of(darlston, jon).
parent_of(williamSr, williamJr).
parent_of(jefferine, williamJr).
parent_of(phil, zxvana).
parent_of(lacey, zxvana).
parent_of(phil, zxrai).
parent_of(lacey, zxrai).
parent_of(leonie, phil).
parent_of(baldwin, phil).
parent_of(leonie, suzette).
parent_of(leonie, suzette).
parent_of(leonie, charlene).
parent_of(baldwin, charlene).
parent_of(leonie, jefferine).
parent_of(baldwin, jefferine).
parent_of(tile, leonie).
parent_of(banca, leonie).

% Predicates
father_of(X, Y) :- parent_of(X, Y), male(X).
mother_of(X, Y) :- parent_of(X, Y), female(X).
daughter_of(X, Y):- parent_of(Y, X),female(X). 
son_of(X, Y):- parent_of(Y, X), male(X). 
sister_of(X, Y):- sibling(X, Y), female(X).
sibling_of(X,Y):- parent_of(Z, X), parent_of(Z, Y), not(X = Y).
brother(X, Y):- sibling(X, Y), male(X).
grandmother(X, Z):- parent_of(X, Y), parent_of(Y, Z), female(X).
grandfather(X, Z):- parent_of(X, Y), parent_of(Y, Z), male(X).
ancestor_of(X, Y):- parent_of(X, Y).
ancestor_of(X, Y):- parent_of(X, Z), ancestor_of(Z, Y).
