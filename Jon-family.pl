% Write a PROLOG program that implements a family database for your family. 
% Save it as an ordinary text file named family.pl.
% Your program should implement the following facts for your:
% immediate family, grandparents, and  great-grandparents.

% Online compiler https://swish.swi-prolog.org/

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
father_of(X, Y) :- parent_of(X, Y), male(X).
mother_of(X, Y) :- parent_of(X, Y), female(X).
