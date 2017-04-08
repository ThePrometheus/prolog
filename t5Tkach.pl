
gt(X,Y):- X > Y.
%z051: traversal of binary tree
%?- z051(t(6,t(4,t(3,nil,nil),t(5,nil,nil)),t(8,t(7,nil,nil),t(9,nil,nil))),X).
%X = [3, 4, 5, 6, 7, 8, 9].

z051(nil,[]).

z051(t(X,Left,Right),Xs):- z051(Left,Ls), z051(Right,Rs), append(Ls,[X|Rs],Xs).
% z052: Number of leafs in tree.
%?- z052(t(6,t(4,t(3,nil,nil),t(5,nil,nil)),t(8,t(7,nil,nil),t(9,nil,nil))),X).
%X = 4.
z052(nil,0).
z052(t(_,nil,nil),1):- !.
z052(t(_,Left,Right),Node):- z053(Left,Node1), z053(Right,Node2), Node is Node1+Node2.
% z053: Number of heihgt
%?- z053(t(6,t(4,t(3,nil,nil),t(5,nil,nil)),t(8,t(7,nil,nil),t(9,nil,nil))),X)
% X =3.

z053(nil,0).
z053(t(_,Left,Right),Height):- z053(Left,Height1), z053(Right,Height2),H3 is max(Height1,Height2), Height is H3 + 1.

% z054: Number of nodes in binary tree.
% z054(t(6,t(4,t(3,nil,nil),t(5,nil,nil)),t(8,t(7,nil,nil),t(9,nil,nil))),X).
% X = 7.

z054(nil,0).
z054(t(_,Left,Right),NodeLength):- z054(Left,NodeLength1), z054(Right,NodeLength2), NodeLength is NodeLength1 + NodeLength2 +1.



% Z055: Show 2-3 tree 
%z055(n2(n2(n3(n2(nil,1,nil),3,n2(nil,3,nil),4,n2(nil,4,nil)),5,n2(n2(nil,5,nil),7,n2(nil,7,nil))),8,n2(n3(nil,10,nil,12,nil),13,n2(nil,15,nil)))).



%
%   --
%          15
%          --
%     --
%     13
%     --
%          --
%          12
%          10
%          --
%--
%8
%--
%               --
%               7
%               --
%          --
%          7
%          --
%               --
%               5
%               --
%     --
%     5
%     --
%               --
%               4
%               --
%          --
%          4
%               --
%               3
%               --
%          3
%          --
%               --
%               1
%:--
%true.

z055(Tree):- show(Tree,0).
show(nil,_).

show(l(A), Height):- tab(Height), write(A), nl.

show(n2(T1,M,T2),Height):- Height1 is Height + 5, show(T2,Height1),
    tab(Height),
    write(--),nl,
    tab(Height), write(M),nl,
    tab(Height), write(--), nl,
    show( T1,Height1).
show(n3(T1,M2, T2,M3,T3),Height):- Height1 is Height + 5 ,
 show(T3,Height1),
 tab(Height), write(--), nl,
 tab(Height), write(M3),nl,
 show(T2,Height1),
 tab(Height),write(M2), nl,
 tab(Height), write(--), nl,
 show(T1, Height1).



%z056: FInd elem in avl -tree
%
%?- z056(5,n2(n2(nil,5,nil),8,n2(nil,13,nil))).
%Success! 5
%true.
%
z056(X,n2(_,X,_)):- write("Success! "),write(X),!.
z056(X,n3(_,X,_,_,_)):- write("Success! "), write(X),!.
z056(X, n3(_,_,_,X,_)):- write(X),!.
z056(X, n2(T1,_,_)):- z056(X,T1),!.
z056(X,n2(_,_,T2)):- z056(X,T2),!.
z056(X,n3(T1,_,T2,_,T3)):- z056(X,T1), z056(X,T2),z056(X,T3).


%?- z057(t(6,t(4,t(3,nil,nil),t(5,nil,nil)),t(8,t(7,nil,nil),t(9,nil,nil)))).
%true.


%?- z058(n2(n2(nil,5,nil),8,n2(nil,13,nil))).
%true
z057(nil).
z057(t(_,Left,Right)):- z057(Left), z057(Right).


z058(nil).
z058(n2(T1,_,T2)):- z058(T1), z058(T2).
z058(n3(T1,_,T2,T3)):- z058(T1), z058(T2), z058(T3).

