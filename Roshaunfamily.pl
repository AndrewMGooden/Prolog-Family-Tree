%Write a PROLOG program that implements a family database for your family. Save it as an ordinary 
%text file named family.pl.
%Your program should implement the following facts for your immediate family, grandparents, and 
%great-grandparents.

%Compiler:https://swish.swi-prolog.org/

%Gender Declarations

male(_X).
male(cgee).
male(smug).
male(james).
male(glan).
male(cgee).
male(hodgson).
male(leigh).
male(west).
male(roshaun).

female(_Y).
female(cynthia).
female(ruth).
female(jean).
female(caroline).
female(catherine).
female(anbal).
female(tash).
female(kay).

%Declaration of Parents
parent_of(_X, _Y).
parent_of(jean,smug).
parent_of(jean,cynthia).
parent_of(glan,james).
parent_of(glan,ruth).
parent_of(anbal,caroline).
parent_of(leigh,jean).
parent_of(anbal,glan).
parent_of(leigh,hodgson).
parent_of(west,cgee).
parent_of(west,catherine).
parent_of(kay,anbal).
parent_of(kay,leigh).
parent_of(tash,anbal).
parent_of(tash,west).
parent_of(roshaun,anbal).
parent_of(roshaun,leigh).
 

%Predicates
%Determine father and mother predicates through combination of gender and parent facts.
father_of(X,Y):-parent_of(X,Y), male(X).
mother_of(X,Y):-parent_of(X,Y), female(X).

%Determines grandparent by checking if grandparent is parent of parent and checks
%gender fact.
grandmother(X,Z):- parent_of(X,Y),parent_of(Y,Z),female(X).
grandfather(X,Z):- parent_of(X,Y),parent_of(Y,Z),male(X).

%Determines parenthood to the nth degreee
ancestor_of(X,Y):-parent_of(X,Y).
ancestor_of(X,Y):-parent_of(X,Z),ancestor_of(Z,Y).

%Sibling Predicates

%Determines sibling if parent is shared.
sibling_of(X,Y):-parent_of(Z,X),parent_of(Z,Y),not(X = Y).

%Determines sibling type based on gender and sibling predicates. 
sister_of(X,Y):-sibling_of(X,Y),female(X).
brother_of(X,Y):-sibling_of(X,Y),male(X).

%Determines child type based on gender and parent predicates.
daughter_of(X,Y):- parent_of(Y,X),female(X). 
son_of(X,Y):- parent_of(Y,X),male(X). 




       
            
