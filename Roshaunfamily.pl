Write a PROLOG program that implements a family database for your family. Save it as an ordinary 
text file named family.pl.
Your program should implement the following facts for your immediate family, grandparents, and 
great-grandparents.
female(Y).
female(tash).
female(kay).
female(anbal).
female(jean).
female(caroline).
female(catherine).
male(X).
male(M) :- family([_,M],_).
male(M) :- family(_,[_,Ss]), member(M,Ss).
male(roshaun).
male(leigh).
male(west).
male(cgee).
male(glan).
male(cgee).
male(hodgson).
parent_of(P,C) :- father_of(P,C).
parent_of(P,C) :- mother_of(P,C).
parent_of(kay,anbal).
parent_of(kay,leigh).
parent_of(tash,anbal).
parent_of(tash,west).
parent_of(roshaun,anbal).
parent_of(roshaun,leigh).
parent_of(anbal,caroline).
parent_of(leigh,jean).
parent_of(anbal,glan).
parent_of(leigh,hodgson).
parent_of(west,cgee).
parent_of(west,catherine).
sibling(X,Y):-parent_of(Z,X),parent_of(Z,Y),not(X=Y).
mother_of(X,Y):-parent_of(X,Y), female(X).
father_of(X,Y):-parent_of(X,Y), male(X).
father_of(D,C) :- family([_,D],[Ds,Ss]),
 (member(C,Ds);
 member(C,Ss)).

daughter_of(X,Y):- parent_of(Y,X),female(X). 
sister(X,Y):-sibling(X,Y),female(X).
son_of(X,Y):- parent_of(Y,X),male(X). 
grandmother(X,Z):- parent_of(X,Y),parent_of(Y,Z),female(X).
grandfather(X,Z):- parent_of(X,Y),parent_of(Y,Z),male(X).
brother(X,Y):-sibling(X,Y),male(X).
ancestor_of(X,Y):-parent_of(X,Y).
ancestor_of(X,Y):-parent_of(X,Z),ancestor_of(Z,Y).
family([anbal,leigh],[[kay],[roshaun]]).
family([anbal,west],[[tash],[]]).
member(M,[M|_]). 

       
            
