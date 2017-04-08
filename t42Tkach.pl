%Z01: Find max elem,if X>=y than X else Y
z01(X,Y,X):- X>=Y.
z01(X,Y,Y):- X<Y.
%Z02 max item in speceified list:
z02([X],X).
z02([X,Y|R],M):-z02([Y|R],MR), z01(X,MR,M).
%Z03:Sum of all elms  in the list
% if list is empty
% H - head, T - tail, Y - result,YT - result obtained form tail
z03([],0).
z03([H|T],Y):- z03(T,YT),Y is H + YT.
%Z04: If the list is ordered 
% if one elem in the list
z04([X]).
% Travers each consequtive pair of X,Y whether X<=Y.
z04([X, Y | T]):- X =< Y,z04([Y|T]).
%z05:find partial sums
% S - set, SM - sum , SB - subset(output)
z05([],0,[]).
z05([H|T],SM,[H|SB]):-SM1 is SM-H,z05(T,SM1,SB).
z05([H|T],SM,SB):- z05(T,SM,SB).

