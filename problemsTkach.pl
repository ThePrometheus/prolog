findSolution(X):-findSolution(5,X).
findSolution(X,T):- mod(X-2,3)=:=0,
                    mod(X-3,2)=:=0,
                    mod(X+4,5)=:=0,
                    mod(X-5,6)=:=0,
                    mod(X-5,4)=:=0,
                    mod(X-6,5)=:=0,
                    mod(X+7,8)=:=0,
                    mod(X+8,7)=:=0,
                    T is X,!.
findSolution(X,T):- X1 is X + 1 ,findSolution(X1,T).
