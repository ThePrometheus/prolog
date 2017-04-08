s(X,Y):-Y is X+1.
dec1(X,Y):-s(0,T1),dd(X,0,T1,Y).
dd(X,Y,Z,Y):-X=Z,!.
dd(X,Y,Z,V):-s(Y,Y1),s(Z,Z1),dd(X,Y1,Z1,V).
summa(X,0,X):-!.
summa(X,Y,Z):-s(X,X1),dec1(Y,Y1),summa(X1,Y1,Z).
minus(X,Y,0):-X=<Y,!.
minus(X,Y,Z):-mn(X,Y,0,Z).
mn(X,Y,Z,Z):-summa(Y,Z,X1),X1=X,!.
mn(X,Y,Z,V):-s(Z,Z1),mn(X,Y,Z1,V).
mult(_,0,0):-!.
mult(0,_,0):-!.
mult(X,Y,Z):-ml(X,X,Y,Z).
ml(_,Y,Z,Y):-s(0,Z1),Z1=Z,!.
ml(X,Y,Z,V):-dec1(Z,Z1),summa(X,Y,Y1),ml(X,Y1,Z1,V).

%Mod function  a(mod B)
z01(X,Y,Z):-X >0,Y >0, X<Y, mod(X,Y,Z).
z01(X,Y,Z):-X >0,Y >0, X>Y, mod(Y,X,Z).


mod(X,X,0):-!.
mod(X,Y,0):- X=Y,!.
mod(X,Y,Z):- X < Y, minus(Y,X,Y1),mod(X,Y1,Z).
mod(X,Y,Z):- X > Y,Z is Y,!. 
% Rem function 
z11(X,X,0):-!.
z11(X,0,0):-!.
z11(0,Y,0):-!.

z11(X,Y,Z):-X >0,Y >0, X <Y,T is X, rem(X,Y,Z,T).
z11(X,Y,Z):-X >0,Y >0, X> Y,T is Y,rem(Y,X,Z,T).

rem(X,Y,Z,T):-X <Y, summa(X,T,X1),rem(X1,Y,Z,T).
rem(X,Y,Z,T):- X>Y,Z is X - T,!.
rem(X,Y,Z,T):- X=Y,Z is X,!.

%Exponentiation
% N - power , X^n = Y


z02(0,0,_) :-!,fail .
z02(X,N,Z):-z02(X,N,1,Z).
z02(_,0,Z,Z ).
z02(X,N,T,Z ):-N > 0,T1 is T * X,N1 is N-1 ,z02( X,N1,T1,Z ).
z02(_,0,Z,Z ):- N < 0,T1 is T / X ,N1 is N+1 , z02(X ,N1 ,T1 ,Z ) .
 
 % Ramainder of full  
z03(0,0):-!.
z03(1,1):-!.
z03(X,Z):- z03(X,2,Z).
z03(X,T,Z):- T1 is T * T ,T1 < X,T2 is T + 1, z03(X,T2,Z).
z03(X,T,Z):- T1 is T *T, X = T1,!.
z03(X,T,Z):- T1 is T * T, T1 > X,T2 is T -1,!.


