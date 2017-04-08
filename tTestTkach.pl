digit(1).
digit(2).
digit(3).
digit(4).
digit(5).
digit(6).
digit(7).
digit(8).
digit(9).
%Z01 : SIn X
%?- sinus(0.1,0.0001,X).
%X = 0.099875.

sinus(X,Epsilon,Y):- sinus(X,Epsilon,1,X,X,Y).
sinus(_,_,10000,_,Sum,_,Sum).
sinus(X,Epsilon,_,Sum,_,Sum):- sin(X,Y),abs(Sum-Y)<Epsilon,!.
sinus(X,Epsilon,N,Sum,Temp,Y):- T1 = -Temp*X*X/((2*(N+1))*(2*N)),S1 is Sum + T1,N1 is N+1,sinus(X,Epsilon,N1,S1,T1,Y).

% Z02:
%z02(L,N).
%L = [[1, 1, 1, 1, 1, 1], [1, 1, 2, 1, 1, 2], [1, 1, 2, 1, 2, 1], [1, 1, 2, 2, 1|...], [1, 1, 3, 1|...], [1, 1, 3|...], [1, 1|...], [1|...], [...|...]|...],
%N = 32661.

digit7(0).
digit7(1).
digit7(2).
digit7(3).
digit7(4).
digit7(5).
digit7(6).

sum2(A,B,C,D,E,F):- digit(A),digit(B),digit(C),digit(D),digit(E),digit(F),
                  S1 is A + B + C,
                  S2 is D +E +F,
                  S1=:=S2.
z02(L,N):- findall(X,(sum2(A,B,C,D,E,F),X=[A,B,C,D,E,F]),L),length(L,N).

                  
                  
                  comb_rep(0,_,[]).
comb_rep(N,[X|T],[X|RComb]):- N >0,N1 is N-1,comb_rep(N1,[X|T],RComb).
comb_rep(N,[_|T],RComb):- N>0,comb_rep(N,T,RComb).

% z03


% z06: Find Nth elem of list 
% element_at(X,[a,b,c,d,e],3)
% X = c
parent(alex,julia).
parent(alex,rosa).
parent(lina,julia).
parent(lina,rosa).
parent(romeo,peter).
parent(julia, peter).
parent(rosa,sylvia).
parent(oscar,ida).
parent(eva,ida).
parent(eva,bruno).
parent(peter,bruno).
parent(peter,georg).
parent(peter,georg).
parent(peter,irma).
parent(ruth,irma).
parent(sylvia,otto).
parent(syliva,pascal).
parent(irma, olga).
parent(irma,jean).
parent(otto,olga).
parent(otto,jean).
parent(jean, tina).
parent(marie, tina).

male(alex).
male(romeo).
male(oscar).
male(peter).
male(bruno).
male(georg).
male(otto).
male(pascal).
male(jean).

husband(alex,lina).
husband(romeo,julia).
husband(oscar,eva).
husband(peter,ruth).
husband(jean,marie).

husband(otto,irma).% wife(X,alex).
% X = lina.

wife(X,Y):- husband(Y,X).
%child(X,otto).
% X = olga

child(X,Y):- parent(Y,X).
% female(eva).
% true

female(X):- husband(Y,X),male(Y).

% ?- grandparent(X,georg).
% X = romeo 

grandparent(X,Y):- parent(X,Z),parent(Z,Y).
%?- grandpa(X,georg).
%X = romeo 

grandpa(X,Y):- grandparent(X,Y), male(X).
%?- grandma(X,georg).
%X = julia ;
%X = julia .


grandma(X,Y):- grandparent(X,Y), female(X).
%father(X,georg).
%X = peter ;

father(X,Y):-parent(X,Y),male(X). 
%?- mother(X,peter).
%X = julia.

mother(X,Y):- parent(X,Y),female(X).
%grandchild(X,romeo).
%X = bruno 
grandchild(X,Y):- grandparent(Y,X).
%?- siblings(ida,bruno).
%true 

siblings(X,Y):- parent(Z,X),parent(Z,Y).
%?- sister(irma,georg).
%true .

brother(X,Y):- siblings(X,Y),male(X).
%brother(georg,irma).
%true 

sister(X,Y):- siblings(X,Y), female(X).

%Z04:
%XX+YZ=QW
%AY+X=BQ
%ZY+ZX=BQ
%XX-AY=ZY
%YZ-X=ZX
%QW-BQ=BQ
%[1]  ?- z04(X,Y,Z,Q,W,A,B).
%X = Y, Y = A, A = B, B = 1,
%Z = 3,
%Q = 2,
%W = 4 .
z04(X,Y,Z,Q,W,A,B):- digit(X),digit(Y),digit(Z),digit(Q),digit(W),digit(A),digit(B),
                    XX is X*10+X,
                    YZ is Y*10 + Z,
                    QW is Q*10+W,
                    AY is A*10 + Y,
                    BQ is B*10 + Q,
                   QW is XX + YZ,
                   BQ is  AY + X,
                    ZX is YZ - X,
                    ZY is XX-AY,
                   BQ is  ZY+ZX,
                   BQ is QW-BQ,
                   BQ is  QW-BQ.







%Z05: KOT+KTO=TOK


%?- z05(X,Y,Res),sum(X,Y,Res).
%X = [4, 5, 9],
%Y = [4, 9, 5],
%Res = [9, 5, 4] .




%All three list are empty
sum(X,Y,Z):- sum1(X,Y,Z,0,0,[0,1,2,3,4,5,6,7,8,9],_).

sum1([],[],[],0,0,Digits,Digits).
%All 3 numbers(X,Y,Z) have left-most digits and remaining digits on the right.
% Conditions: three numbers N1,N2,N,shift carry(Carry2) to the left ,and leave a subset of decimal digits
%Left-most digits :Digits1,Digits2,Digits - are satiysfying:
%Carry = (Carry1+ Digits(X)+Digits(Y)div 10.
% Digits(Z)=(Carry1+Digits(X)+Digits(Y)
sum1([Digits1|N1],[Digits2|N2],[Digits|N],Carry1,Carry,Digs1,Digs):- sum1(N1,N2,N,Carry1,Carry2,Digs1,Digs2),total(Digits1,Digits2,Carry2,Digits,Carry,Digs2,Digs).
%Select digit for D1,then for D2,then for D
total(D1,D2,C1,D,C,Digs1,Digs):-
 rem(D1,Digs1,Digs2),
 rem(D2,Digs2,Digs3),
 rem(D,Digs3,Digs),
 S is D1+D2+C1,
 D is S mod 10,
 C is S div 10.
%Input must be already instantiated !!!
 rem(Input,List,List):- nonvar(Input),!.
 rem(Input,[Input|List],List).
 rem(Input,[Head|Tail],[Head|Tail1]):- rem(Input,Tail,Tail1).

 z05([K,O,T],[K,T,O],[T,O,K]).




element_at(X,[X|_],1).
element_at(X,[_|List],N):- N > 1 , N1 is N -1, element_at(X,List,N1).

%Z08: Flatten the list 
conc([],L,L).
conc([X|L1], L2,[X|L3]):-
 conc(L1,L2,L3).


% my_flatten[a,[b,[c,d],e]],X).


% X = [a,b,c,d,e]
my_flatten([Head|Tail],FlatList):- my_flatten(Head, FlatHead),my_flatten(Tail, FlatTail), conc(FlatHead, FlatTail, FlatList).
my_flatten([],[]).
my_flatten(X,[X]).

% Z08: Insert at the list 
% insert_at(alfa,[a,b,c,d],2,L).
% L = [a,alfa,b,c,d]
insert_at(X,List,N,ResultList):- insert_at(List,X,N,1,ResultList).

insert_at([],X,_,1,[X]).
insert_at([],_,_,_,[]).
insert_at(List,X,N,N,[X|Tail]):- N1 is N +1 ,insert_at(List,X,N,N1,Tail).
insert_at([Head|Tail], X,N,I,[Head|RTail]):- I1 is I +1 , insert_at(Tail,X,N,I1,RTail).

%Z09: Duplicate elms given number of times
% dupli([a,b,c],3,X).
% X = [a,a,a,b,b,b,c,c,c]
dupli(List,N,X):- dupli(List,N,X,N).

dupli([],_,[],_).
dupli([_|Tail],N,X,0):- dupli(Tail,N,X,N).
dupli([Head|Tail],N,[Head|Y],T):- T > 0 , T1 is T - 1 , dupli([Head|Tail],N,Y,T1).


