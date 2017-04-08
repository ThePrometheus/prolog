start(S):- S=[A,B,C,D,E,F,G,H,I],set_equal(S,[1,2,3,4,5,6,7,8,9]),
           square(S),write_square(S).
square([A,B,C,D,E,F,G,H,I]):-line([A,B,C],S),
                             line([D,E,F],S),
                             line([G,H,I],S),
                             line([A,D,G],S),
                             line([B,E,H],S),
                             line([C,F,I],S).
line([X,Y,Z],Sum):- Sum is X + Y + Z.
write_square([A,B,C,D,E,F,G,H,I]):-
   write('____",nl,write('|'),
   write(A),tab(1),write(B),tab(1),write(C),
   write('|'),nl,write('|'),
   write(D),tab(1),write(E),tab(1),write(F),
   write('|'),nl,write('|'),
   write(G),tab(1),write(H),tab(1),write(I),
   write('|'),nl,write('-----'),nl.

