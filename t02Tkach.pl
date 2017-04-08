%Z01: Division with remainder (only for X > 0 , X belongs to N).
% X,Y - numbers, M - full part M(13/4)=3,R-remainder R(13/4)=1, T 
% is a counter.
z01(X,Y,1,0):- X=:=Y.
z01(X,Y,M,R):- z01(X,Y,M,R,0).
z01(X,Y,T,X,T):- X<Y, !.
z01(X,Y,M,R,T):- X1 is X-Y,T1 is T + 1,z01(X1,Y,M,R,T1).
%Z02:Linear and logarithmic exponentiation
%Linear
%X^Y = Z,if Y==0,then z=1
z02(_,0,Z):- Z=1,!.
%while(!Y==0) Z = X* Z1,Y=Y-1
z02(X,Y,Z):- Y1 is Y -1,z02(X,Y1,Z1),Z is X*Z1.
%Logarithmic 
%for each Y(mod 2)==1,X= X*X,then shift Y=Y/2, repeat while Y!=0.
z12(_,0,Z):- Z=1,!.
z12(X,Y,Z):- Y mod 2 =:= 1, X1 is X*X,Y1 is Y>>1,z12(X1,Y1,Z1),Z is X*Z1,!.
%else X = X*X,y/2,repeat
z12(X,Y,Z):- X1 = X*X,Y1 is Y>>1,z12(X1,Y1,Z1),Z is Z1,!.
%Z03:Fibonacci numbers by recusion 
% F(1)=1
% F(2)=2
z03(1,Y):- Y=1,!.
z03(2,Y):- Y=1,!.
% F(n)= F(n-1)+F(n-2)
z03(X,Y):- X1 is X-1, X2 is X - 2, z03(X1,Y1), z03(X2,Y2),Y is Y1+Y2.
%Z13: Fibonacci number using iteration 
% X - input,Y -output, T - temp(iteration counter),
% F1 = F(n-1),F2=F(n),F3=F(n+1).
z13(X,Y):- z13(X,Y,0,0,0),!.
z13(X,Y,T,_,F):- T = X, Y= F,!.
z13(X,Y,0,_,_):- z13(X,Y,1,0,1).
z13(X,Y,T,F1,F2):- F3 is F1+F2, T1 is T+1,z13(X,Y,T1,F2,F3).
%Z04:Find all multipliers of X and then all primes and list them  
% if X mod 2 ==0, X=X/2 or X=X/F, repeat.

z04(X):- X<2,!.
z04(X):- prime(X,F,2),write(F),nl,X1 is X div F,z04(X1).
%Prime predicate: X - input, Z- prime; if x mod z == 0 .
prime(X,_,Z):- Z > X, !.
prime(X,Y,Z):- X mod Z =:=0, Y is Z, !.

prime(X,Y,Z):- Z1 is Z + 1, prime(X,Y,Z1).
%z05 Factorial = 1/1!+1/2!....(1/X!)
% T -counter,Y- result,X-input, I - iteration value, Z- 
%accumulator.acc(n-1) + i/x!
z05(X,Y):- z05(X,Y,1,1,1),!.
z05(X,Y,_,T,Z):- T = X,Y=Z,!.
z05(X,Y,I,T,Z):- T1 is T+1, I1 is I/T1,Z1 is Z+I1,z05(X,Y,I1,T1,Z1).

