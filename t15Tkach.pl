in_tree(X, tree(_,X,_)).
in_tree(X,tree(L,_,_)):-in_tree(X,L).
in_tree(X,tree(_,_,R)):-in_tree(X,R).

add(nil, X, tree(nil,X,nil)):-!.
add(tree(L,A,R),X,tree(L1,A,R)):-X<A, add(L,X,L1),!.
add(tree(L,A,R),X,tree(L,A,R1)):-X>A, add(R,X,R1).

make_tree(List,Tree):-make_tree(List,nil,Tree).
make_tree([],Tree,Tree):-!.
make_tree([H|T],Tree,TreeRes):-add(Tree,H,Tree1), make_tree(T,Tree1,TreeRes).

in_tree1(X, tree(_,X,_)):-!.
in_tree1(X,tree(L,Root,_)):-X<Root, in_tree(X,L),!.
in_tree1(X,tree(_,Root,R)):-X>Root,in_tree(X,R).

add23( Tree, X, Tree1) :- 
	insert( Tree, X, Tree1).
add23( Tree, X, v2( T1, Ì2, T2) ) :-
	insert( Tree, X, T1, Ì2, T2).     
add23( nil,X,l(X)).

:-discontiguous(insert/3).
:-discontiguous(insert/5).

insert( l(A), X, l(A), X, l(X) ) :-
	X>A.
insert( l(A), X, l(X), A, l(A) ) :-
	A>X.
insert( v2( T1, Ì, T2), X, v2( NT1, Ì, T2) ) :-
	Ì>X,
	insert( T1, X, NT1).
insert( v2(T1, M, T2), X, v3( NT1a, Mb, NT1b, M, T2)):-
	M>X,
	insert( T1, X, NT1a, Mb, NT1b).
insert( v2( T1, Ì, T2), X, v2( T1, Ì, NT2) ) :-
	X>Ì,
	insert( T2, X, NT2).
insert( v2( T1, M, T2), X, v3( T1, M, NT2a, Mb, NT2b) ) :-
	X>M,
	insert( T2, X, NT2a, Mb, NT2b).
insert(v3( T1, M2, T2, M3, T3), X, v3( NT1, M2, T2, M3, T3) ):-
	M2>X,
	insert( T1, X, NT1).
insert( v3( T1, Ì2, T2, Ì3, T3), X,
		v2( NT1à, Ìb, NT1b), Ì2, v2( T2, Ì3, T3) ) :-
	Ì2>X,
	insert( T1, X, NT1à, Ìb, NT1b).
insert( v3( T1, Ì2, T2, Ì3, T3), X,
                v3( T1, Ì2, NT2, Ì3, T3) ) :-
	X>Ì2, Ì3>X,
	insert( T2, X, NT2).
insert( v3( T1,M2,T2, M3, T3), X,
                v2( T1, M2, NT2a), Mb, v2( NT2b, M3, T3) ) :-
	X>M2, M3>X,
	insert( T2, X, NT2a, Mb, NT2b).
insert( v3( T1, M2, T2, M3,T3), X,
                v3( T1, M2, T2, M3, NT3) ) :-
	X>M3,
	insert( T3, X, NT3).
insert( v3( T1, M2, T2, M3, T3), X,
                v2( T1, M2, T2), M3, v2( NT3a, Mb, NT3b) ) :-
	X>M3,
	insert( T3, X, NT3a, Mb, NT3b).



add_avl( nil/0, X, t( nil/0, X, nil/0)/1):-!.

add_avl( t(L, Y, R)/Hy, X, NewTree) :-
	X>Y,
	add_avl( R, X, t(R1, Z, R2)/_),
	append1( L, Y, R1, Z, R2, NewTree).

add_avl(t(L,Y,R)/Hy,X,NewTree):-
	X<Y,
	add_avl(L,X,t(L1,Z,L2)/_),
	append1(L1,Z,L2,Y,R,NewTree).
append1( T1/H1, A, t(T21, B, T22)/H2, C, T3/H3,
	t( t( T1/H1, A, T21)/Ha, B, t( T22, C, T3/H3)/Hc)/Hb) :-
	H2> H1, H2>H3,
	Ha is H1+1,
	Hc is H3+1,
	Hb is Ha+1.
append1( T1/H1, A, T2/H2, C, T3/H3,
	t( T1/H1, A, t( T2/H2, C, T3/H3)/Hc)/Ha) :-
	H1 >= H2, H1 >= H3,  
	max1( H2, H3, Hc),
	max1( H1, Hc, Ha).
append1( T1/H1, A, T2/H2, C, T3/H3,
	t( t( T1/H1, A, T2/H2)/Ha, C, T3/H3)/Hc) :-
	H3 >= H2, H3 >= H1,           
	max1( H1, H2, Ha),
	max1( Ha, H3, Hc).

max1( U, V, Ì) :-
	U > V,  !,  Ì is U + 1;         
	Ì is V + 1.
	
%run:-read(X), make_tree(X,T), write(T), read(_).
%:-initialization(run).


z057(nil).
z057(t(_,L,R)):- z057(L),z057(R).

