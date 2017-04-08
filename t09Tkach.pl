%Z91 : Solve riddle with water boles 
%
%n :
%
%Bole A: 4litres
% Bole B : 0litres
%
% Bole A: 1litres
%  Bole B : 3litres
%
%  Bole A: 1litres
%   Bole B : 0litres
%
%   Bole A: 0litres
%    Bole B : 1litres
%
%    Bole A: 5litres
%     Bole B : 1litres
%
%     Bole A: 3litres
%      Bole B : 3litres
%
%      Bole A: 3litres
%       Bole B : 0litres
%
%       Bole A: 0litres
%        Bole B : 3litres
%
%        Bole A: 5litres
%         Bole B : 3litres
%
%         Bole A: 5litres
%          Bole B : 0litres
%
%          Bole A: 0litres
%           Bole B : 0litres
%           false.
%

z91:-  z91(state(0,0),state(4,_)).
 not(P):-P,!,fail;true.
 z91(S,G):-path(S,G,[S],L),nl,write('Solution :'),nl,getSolutionList(L),!,fail.
 z91(_,_).

getSolutionList([Head1|Tail]) :- !,get(Head1),getSolutionList(Tail).
getSolutionList(_).

get( state(X,Y)) :-!,nl,write('Jar  A: '),write(X),write('litres'),nl,write(' Jar B : '),write(Y),write('litres'),nl. 


% List all possible move
move(state(0,B),state(5,B)).
move(state(A,0),state(A,3)).
move(state(X,3),state(X,0)).
move(state(5,Y),state(0,Y)).
move(state(X,Y),state(X1,Y1)):-fillin(X,Y,5,3,X1,Y1).
move(state(X,Y),state(X1,Y1)):-fillin(Y,X,3,5,Y1,X1).

% Extreme cases
empty(_,Res):- Res=0.
fill(_,M,Res):- Res=M.
% Changes 
fillin(X,Y,_,Y,JarA,JarB):- JarA=X, JarB=Y,!.
fillin(0,Y,_,_,JarA,JarB):-  JarA=0,JarB=Y,!.
fillin(X,Y,F,I,JarA,JarB):- X1 is X-1, Y1 is Y+1,!,fillin(X1,Y1,F,I,JarA,JarB).
% Get path 
path(S,G,L,L1):-S=G,L1 = L,!;move(S,S1),\+ member(S1,L),path( S1,G,[S1|L],L1).
path(G,G,T,T):-!.




%Z92:Find a minimal spanning tree 
z92(Graph):- 
              
              gterm(H,Graph),
              write('Given graph'),
              write(H),nl,
              spanningtree(Graph,Tree,_),
                gterm(TH,Tree),      
                write('Solution:'),
                write(TH).

%TE - TreeEdges, ESorted- EgesSorted,TEU - TreeEdgesUnsorted
spanningtree(graph([N|Ns],Edges),graph([N|Ns],TE),Sum):- predsort(compare_edge_values,Edges,ESorted),transfer(Ns,ESorted,TEU),sort(TEU,TE),edge_sum(TE,Sum).
transfer([],_,[]).
transfer(Ns,GEs,[GE|TEs]):-select(GE,GEs,GEs1),
                           incident(GE,X,Y),
                           acceptable(X,Y,Ns),
                           delete(Ns,X,Ns1),
                           delete(Ns1,Y,Ns2),
                           transfer(Ns2,GEs1,TEs).

% Compare two edges with values V 
compare_edge_values(Order,e(X1,Y1,V1),e(X2,Y2,V2)) :- 
        compare(Order,V1+X1+Y1,V2+X2+Y2).

    edge_sum([],0).
edge_sum([e(_,_,V)|Es],S) :- edge_sum(Es,S1), S is S1 + V. 




% Conversion to graph 
%
%
gterm(HF,GT):- nonvar(GT),!, gterm1(GT,HF).
gterm(HF,GT):- nonvar(HF),!, gterm(HF,GT).


gterm1(graph(Ns,Es),HF) :-  memberchk(e(_,_,_),Es), !, 
   lgt_hf(Ns,Es,HF).

incident(e(X,Y),X,Y).
incident(e(X,Y,_),X,Y).

acceptable(X,Y,Ns) :- memberchk(X,Ns), \+ memberchk(Y,Ns), !.
acceptable(X,Y,Ns) :- memberchk(Y,Ns), \+ memberchk(X,Ns).
   % labelled graph
lgt_hf(Ns,[],Ns).
 lgt_hf(Ns,[e(X,Y,I)|Es],[X-Y/I|Hs]) :-
     delete(Ns,X,Ns1), delete(Ns1,Y,Ns2),
          lgt_hf(Ns2,Es,Hs).
