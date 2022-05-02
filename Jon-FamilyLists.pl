% Rewrite your family database, but this time use PROLOG's lists ([H|T]) to represent the basic facts of 
% your family. Save it as an ordinary text file named familylists.pl.

% Your program should implement the following facts for your immediate family, grandparents, and 
% great-grandparents.

% family([mom,dad],[[daughter1, daughter2],[son1,son2]]).

% In other words, each "nuclear" family is comprised of two lists:

% family(ParentList, ChildrenList). 

% The ParentList is formatted with the name of the mother, followed by the name of the father. 
% The ChildrenList consists of two sublists, the first giving the names of the daughters, in 
% chronological order, and the second giving the names of the sons, in chronological order.

family([tile, banca], [[leonie], []]).
family([leonie, baldwin], [[jefferine, charlene, suzette], [phil]]).
family([jefferine, williamsr], [[], [williamjr]]).
family([charlene, darlston], [[], [jon]]).
family([lacey, phil], [[zxvana, zxrai], []]).

% Parentage Predicates
    % Determines parentage based on parent's position in the
    % parent list and child's presence in the child list.
father_of(D, C) :- family([_, D], [Ds, Ss]), (member(C, Ds) ; member(C, Ss)).
mother_of(M, C) :- family([M, _], [Ds, Ss]), (member(C, Ds) ; member(C, Ss)).
    
    % Determines based on father and mother predicates.
parent_of(P, C) :- father_of(P, C) ; mother_of(P, C).

    % Determines grandparenthood if parent of grandchild's 
    % parents is the granndparent
grandparent_of(G, GC) :-  parent_of(G, P), parent_of(P, GC).
great_grandparent_of(GG, GGC) :- parent_of(GG, G), grandparent_of(G, GGC).

ancestor_of(A, D) :- parent_of(A, D).
ancestor_of(A, D) :- ancestor_of(A, M), parent_of(M, D).

% Gender Predicates
    % Determines gender based on position in the parent list
    % or in the sons/daughters list.
male(M) :- family([_, M], _).
male(M) :- family(_, [_, Ss]), member(M, Ss).
female(F) :- family([F, _], _).
female(F) :- family([_], [Ds, _]), member(F, Ds).

% Child Predicates
    % Determines whether son or daughter based on a confirmed parent
    % and presense in either son or daughter list
son_of(S, P) :- parent_of(P, S), family(_, [_, Ss]), member(S, Ss).
daughter_of(D, P) :- parent_of(P, D), family(_, [Ds, _]), member(D, Ds).

    % Determines eldest if person is the head of their respective list
oldest_son_of(OS, P) :- parent_of(P, OS), family(_, [_, [H|_]]), OS = H.
oldest_daughter_of(OD, P) :- parent_of(P, OD), family(_, [[H|_], _]), OD = H.

% Sibling Predicate
    % Determines sibling hood if a parent is shared
sibling_of(S1, S2) :- parent_of(P, S1),  parent_of(P, S2), not(S1 =  S2).
    % Determines which siblinghood based on the sibling predicate and 
    % the gender predicate
brother_of(B, S) :- sibling_of(B, S), male(B).
sister_of(S, Si) :- sibling_of(S, Si), female(S).
