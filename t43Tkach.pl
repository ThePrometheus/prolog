:- op(500,xf,is_ordered).
:- op(300,fx,zlyttya).
:- op(100,xfx,and).
:- op(200,xfx,iss).
:- op(300,fx,min_el_list).
:- op(100,xfx,is_member_of).
ordered([X]).
ordered([X,Y|Tail]):- X =< Y,ordered([Y|Tail]).

X is_ordered:- ordered(X).

X is_member_of[X|List].
X is_member_of[Head|Tail]:- X is_member_of Tail.


min(X,Y,X):- X =< Y.
min(X,Y,Y):- X > Y.

min_list([X],X).
min_list([X,Y|R],Min):- min_list([Y|R],MinR), min(X,MinR,Min).


min_el_list (List) iss X:- min_list(List,X).

zlyttya [] and List iss List.
zlyttya[X|List1] and List2 iss [X|List3]:- zlyttya List1 and List2 iss List3.

