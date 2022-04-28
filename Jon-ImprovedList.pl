% One shortcoming of this list representation is that it doesn't represent the chronological order of all the 
% children. You can tell who is the oldest son and who is the oldest daughter but not who is the oldest 
% child.
% So we now want to rewrite our database using the following representation scheme:
%  family([mom,dad],[[child1,female],[child2,male],[child3,male]]).

family([tile, banca], [[leonie, female]]).
family([leonie, badlwin], [[jeffine, female], [charlene, female], [suzette, female], [phil, male]]).
family([jeffine, williamsr], [[williamjr, male]]).
family([charlene, darlston], [[jon, male]]).
family([lacey, phil], [[zxvana, female], [zxrai, female]]).

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

father_of(F, C) :- family([_, F], Cs), member([C|_], Cs).
mother_of(M, C) :- family([M, _], Cs),  member([C|_], Cs).
parent_of(P, C) :- father_of(P, C) ; mother_of(P, C).
sibling_of(S1, S2) :- parent_of(P, S1), parent_of(P, S2).
brother_of(B, S) :- sibling_of(B, S) , male(B).
sister_of(S, Si) :- sibling_of(S, Si), female(Si).
oldest_child_of(C, P) :- parent_of(P, C), family(_, Cs), on([C|_], Cs).
oldest_daughter_of(D, P) :- parent_of(P, D), 
