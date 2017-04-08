%Helper functions
%?- add (4,[1,2,3],X)
% X = [4,1,2,3].
add(X,List,[X|List]).
%reverse List 
%?-reverseL([1,2,3],R).
% R = [3,2,1].

reverseL(List,ResultList):- reversel(List,[],ResultList).

reversel([],List,List).
reversel([Head|Tail],Item,ResultList):-
    reversel(Tail,[Head|Item],ResultList).
%Find all negative numbers , find their places by using index, then create list list and reverse it
%?- z041([0,3,2,-4,5,-6],R).
%R = [4, 6].

z041(List,ResultList):- find_negative(List,[],1,TempList),reverseL(TempList,ResultList),!.

find_negative([],X,_,X).
find_negative([Head|Tail],X,Index,R):- Head < 0,Index1 is Index + 1,find_negative(Tail,[Index|X],Index1,R).
find_negative([Head|Tail], X,Index,ResultList):- Head >=0,Index1 is Index + 1, find_negative(Tail,X,Index1,ResultList).

%z042:  Find all X which need to be replaced, using iteration through list and form a new reversed list with changed elems).

%?- z042([3,3,4],3,X).
%X = [*, *, 4].

z042(List,X,Result):- removeX(X,List,[],PositionList),reverseL(PositionList,Result),!.
removeX(_,[],X,X).
removeX(X,[Head|Tail],Index,R):- Head=:= X, removeX(X,Tail,['*'|Index],R).
removeX(X,[Head|Tail],Index,R):- Head \= X,removeX(X,Tail,[Head|Index],R).
%z043: convert digits to roman system

%?- z043([1,12,15,121,52], Result).
%Result = ['I', 'XII', 'XV', 'CXXI', 'LII'].
% get reverse list of roman numerals
z043(ListArab,ListRoman):-toRomanList(ListArab,[],ListRomanReverse),reverseL(ListRomanReverse,ListRoman),!.
toRomanList([],TempList,TempList).
%for each symbol in list , start procedure transformToRoman(Symbol,Roman numeral).
toRomanList([Head|Tail],TempList,ListRoman):- transformToRoman(Head,R),toRomanList(Tail,[R|TempList],ListRoman).
transformToRoman(X,Result):-transform(X,[],R),reverseL(R,R1),atomic_list_concat(R1,'',Result).
transform(0,R,R).
transform(X,R,Result):- X < 0,!.
transform(X,R,Result) :- X < 4, add('I',R,R1),  Y is X - 1, transform(Y,R1,Result).
transform(X,R,Result) :- X = 4, add('IV',R,R1), transform(_,R1,Result).
transform(X,R,Result) :- X = 5, add('V',R,R1),  transform(_,R1,Result).
transform(X,R,Result) :- X < 9, add('V',R,R1),  Y is X - 5, transform(Y,R1,Result).
transform(X,R,Result) :- X = 9, add('IX',R,R1), transform(_,R1,Result).
transform(X,R,Result) :- X < 40, add('X',R,R1),  Y is X - 10, transform(Y,R1,Result).
transform(X,R,Result) :- X < 50, add('XL',R,R1), Y is X - 40, transform(Y,R1,Result).
transform(X,R,Result) :- X < 90, add('L',R,R1),  Y is X - 50, transform(Y,R1,Result).
transform(X,R,Result) :- X < 100, add('C',R,R1), Y is X-90,   transform(Y,R1,Result).
transform(X,R,Result) :- X < 400, add('C',R,R1), Y is X - 100, transform(Y,R1,Result).


%Z044: Shift by one to right 
% Split list into two sublists
split(List,0,[],List).
split([X|Xs],N,[X|Ys],Zs):- N >0, N1 is N-1,split(Xs,N1,Ys,Zs).
% example , List = [a,b,c,d], S1 = [d], S2 = [a,b,c], ResultList = S1 + S2.
z044(List,ResultList):- length(List,L1) ,L2 is  L1 -1, split(List,L2,Sum1,Sum2), append(Sum2,Sum1,ResultList).
%Z045:perform matrix multiplication 


% collect all elems after element-wise multiplication than reverse.
% X is Matrix(n*n).
% V is Vector( n).
% Y result (n).
%?- z045([[1,0,0],[0,1,0],[0,0,1]],[1,0,3],R).
%R = [1, 0, 3].
%?- z045([[0,0,0],[0,0,0],[0,0,0]],[0,0,3],R).
%R = [0, 0, 0].
%z045([[1,1,1],[2,2,2],[3,3,3]],[2,0,3],R).
%R = [5, 10, 15].

z045(X,V,Y):- matrix_mult_vector(X,V,[],ReversedList), reverseL(ReversedList,Y).
matrix_mult_vector([],_,X,X).
% for each row in matrix : multiply this row * by Vector
matrix_mult_vector([XHead|XTail],V,Left,ResultList):- matrixlist_mult_vector(XHead,V,0,R),
     matrix_mult_vector(XTail,V,[R|Left],ResultList).
% Multiplication each row by a vector(Dot product)
matrixlist_mult_vector([], [], Result,Result).
matrixlist_mult_vector([XListHead|XListTail], [VHead|VTail], Result,R):-Result_new is Result + (XListHead * VHead),matrixlist_mult_vector(XListTail, VTail, Result_new,R).
