% Define operators
:- op(300,xfy,plays_in).
:- op(200,xfy,ad).
:- op(500,xf,is_dead).
% Term 1
play(jimmy,squash).
play(jimmy,football).
% Term 2
play(susan,tennis).
play(susan,basketball).
play(susan,voleyball).

plays_in(X,Y):-play(X,Y).
ad(X,Y):- X, Y.
%QUERY:" jimmy plays_in squash ad jimmy plays_in football "
% - false.
% IF we change priority from op(200,xfy,ad) to op(400,xfy,ad)
% then we would have "jimmy plays_in squash ad jimmy plays_in
% football" ==> true.
% ad - functor ,play_in functor.x, y are  input values.
:- op(300,xfx,was).
:- op(250,xfx,of).
:- op(100,fx,the).
diana was the secretary of the department.

% ?-Who was the secretary of the department 
%  Who = diana;
%  ?- diana was the secretary of What.
%  What - the department;




