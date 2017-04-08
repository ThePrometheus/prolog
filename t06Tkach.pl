findHeight(N1,N2,N):- N1>N2,!,N is N1+1; N is N2 + 1.
% Tree is given as IN Bratko's book Prolog Programming for Artificial Intelligence
% z61: Traverse AVL-tree
% Condtion1 :  left subtreee and right subtree differ in height by 1 at the most.
% Condition 2 : Bogth subtrees themselves are also AVL trees .
%?- z61(tree(tree(nil,2,nil),5,tree(nil,6,tree(nil,5,nil)))).
/**          --
          5
          --
     --
     6
     --
--
5
--
     --
     2
     --
true.
*/
z61(Tree):- z61(Tree,0).

%If tree is empty
z61(nil,_).
z61(l(X),Height):- tab(Height),write(X),nl.

z61(tree(Left,Node,Right),Height):-Height1 is Height + 5 ,
                                   z61(Right,Height1),
                                   tab(Height),
                                   write(--), nl,
                                   tab(Height),
                                   write(Node),nl,
                                   tab(Height),
                                   write(--),nl,
                                   z61(Left,Height1).

%
%Search for  a given elem X in AVL- tree
%?- z62(tree(tree(nil,2,nil),5,tree(nil,6,tree(nil,5,nil))),2).2
%true.
z62(tree(_,X,_),X):- write(X),!.
z62(tree(Left,_,_),X):-z62(Left,X),!.
z62(tree(_,_,Right),X):-z62(Right,X).

%?- z62(tree(tree(nil,2,nil),5,tree(nil,6,tree(nil,5,nil))),1).
%false





% z63 : whether this tree is avl tree 
%?- z63(tree(tree(nil,2,nil),5,tree(nil,6,tree(nil,5,nil)))).
%true .
%?- z63(tree(tree(nil,2,nil),5,tree(tree(nil,4,tree(nil,8,nil)),6,tree(nil,5,nil)))).
% false
z63(Tree):- z63(Tree,_).
%in case of empty tree
z63(nil,0).

 z63(tree(Left,Root,Right),Height):- z63(Left,HeightLeft),
                                     z63(Right,HeightRight), 
                                     (HeightLeft is HeightRight;
                                     HeightLeft is HeightRight +1;
                                     HeightLeft  is HeightRight -1),
                                     findHeight(HeightLeft,HeightRight,Height).


% Deletion of elem in binary dictionary 
%
%
%
%?- z64(tree(nil,3,tree(nil,5,tree(nil,6,nil))),3,Tree1).
%Tree1 = tree(nil, 5, tree(nil, 6, nil)) 
gt(X,Y):- X > Y.

z64(tree(nil,X,Right),X,Right).

z64(tree(Left,X,nil),X,Left).

z64(tree(Left,X,Right),X,tree(Left,Y,Right1)):- deleteminimum(Right,Y,Right1).

z64(tree(Left,X,Right),X,tree(Left1,Root,Right)):- gt(Root,X),z64(Left,X,Left1).

z64(tree(Left,Root,Right),X,tree(Left,Root,Right1)):- gt(X,Root),z64(Right,X,Right1).

deleteminimum(tree(nil,Y,R),Y,R).

deleteminimum(tree(Left,Root,Right),Y,tree(Left1,Root,Right)):- deleteminimum(Left,Y,Left1).
