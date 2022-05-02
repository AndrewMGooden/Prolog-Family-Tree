% One shortcoming of this list representation is that it doesn't represent the chronological order of all the 
% children. You can tell who is the oldest son and who is the oldest daughter but not who is the oldest 
% child.
% So we now want to rewrite our database using the following representation scheme:
%  family([mom,dad],[[child1,female],[child2,male],[child3,male]]).

family([tile, banca], [[leonie, female]]).
family([leonie, baldwin], [[jefferine, female], [charlene, female], [suzette, female], [phil, male]]).
family([jefferine, williamsr], [[williamjr, male]]).
family([charlene, darlston], [[jon, male]]).
family([lacey, phil], [[zxvana, female], [zxrai, female]]).

on(Item, [Item|_]).
size([], 0).
size([_|T], N) :- size(T, N1), N is N1 + 1.

% Gender Predicates
    % Determines gender based on position in the Parent List.
male(M) :- family([_, M], _). 
female(F) :- family([F, _] ,_).

    % Determines gender based on them the [name, gender] format of the child list.
male(M) :- family(_, Cs), member([M, male], Cs). 
female(F) :- family(_,Cs), member([F, female], Cs).

% Parentage Predicates
    % Determines parentage based on position of the parent in the 
    % parent list and presence  of the child in the child list.
father_of(F, C) :- family([_, F], Cs), member([C|_], Cs).
mother_of(M, C) :- family([M, _], Cs),  member([C|_], Cs).

    % Defines parenthood in terms of the mother & father predicates.
parent_of(P, C) :- father_of(P, C) ; mother_of(P, C).

    % Defines ancestorhood in terms of the parent predicate and
    % recusively defines to the nth degree.
ancestor_of(A, D) :- parent_of(A, D).
ancestor_of(A, D) :- ancestor_of(A, M), parent_of(M, D).

% Sibling Predicates
    % Sibling is determined if a parent is shared.
sibling_of(S1, S2) :- parent_of(P, S1), parent_of(P, S2), not(S1  = S2).
    % Type of sibling is defined by the sibling predicate and the
    % gender predicates.
brother_of(B, S) :- sibling_of(B, S) , male(B).
sister_of(S, Si) :- sibling_of(S, Si), female(Si).

% Child Predicates
    % Determined based on parent and gender predicates.
daughter_of(D, P) :- parent_of(P, D), female(D).
son_of(S, P) :- parent_of(P, S), male(S).
    % Determines primacy by removing the first child of a given gender 
    % from the list and then comparing the new and old lists.
oldest_son_of(OS, P) :- (family([_, P], Cs) ; family([P,_], Cs)), member([OS,_], Cs), selectchk([_, male], Cs, R), selectchk([OS, male], Cs, R), print(Cs), print(R).
oldest_daughter_of(OD, P) :- (family([_, P], Cs) ; family([P,_], Cs)), member([OD,_], Cs), selectchk([_, female], Cs, R), selectchk([OD, female], Cs, R), print(Cs), print(R).
    % Takes the head of the child list.
oldest_child_of(C, P) :- parent_of(P, C), family(_, Cs), on([C|_], Cs).
    % Determines the size of the child list. 
number_of_children(P, N) :- (family([_, P], Cs) ; family([P, _], Cs)), size(Cs, N).
    % Determines the number of potential checks for the associated predicate.
number_of_daughters(P, N) :- aggregate(count, daughter_of(_X, P), Y), N is Y+1.
number_of_sons(P, N) :- aggregate(count, son_of(_X, P),Y), N is Y+1.
