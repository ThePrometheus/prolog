% Conditions:
%1)5 houses,5 men,5 animals,5 drinks,5 cigarettes,
%2)Englsihman  in red house.
% 3)Swedish  has a dog.
% 4)Dansih drinks tea.
% 5)Green house is left to white
% 6) Owner of the green house drinks coffe.
% 7) smoker of Pall Mall has a bird
% 8) Owner of 3rd house drinks milk
% 9) Owner of yellow house smokes Dunhill
% 10) Norvegian is in a first 
% 11) Smoker of Marlboro lives near thos who has a cat
% 12) Someone who has a horse lives near those who smokes Dunhill
% 13) Smoker of Winfield drinks beer.
% 14) Norwegian lives near blue house.
% 15) German smokes Rothaus.
% 16)Smoke of MArlboro  - meighbour of those who drinks water.
% Order -Number,  Owner,Color,Drink,Animal,Cigaratte
show([]):-!.
show([H|T]):- write(H),nl,show(T).
%left(X,Y,L):- append(_,[X,Y|_],L).
right(X,Y):- X is Y + 1.
left(X,Y):- right(Y,X).
near(X,Y):- right(X,Y).
near(X,Y):- left(X,Y).
% X - houses,Y - answer 
z81(X,Y):-  X = [building(1,Owner1,Color1,Drink1,Animal1,Cigarette1),
               building(2,Owner2,Color2,Drink2,Animal2,Cigarette2),
               building(3,Owner3,Color3,Drink3,Animal3,Cigarette3),
               building(4,Owner4,Color4,Drink4,Animal4,Cigarette4),
               building(5,Owner5,Color5,Drink5,Animal5,Cigarette5)],

          member(building(_,english,red,_,_,_),X),
          %  write(X),nl,%1
            member(building(_,swedish,_,_,dog,_),X), 
            % write(X),nl,%2
           member(building(_,danish,_,tea,_,_),X),
           %  write(X),nl,%3
           member(building(_,_,_,_,bird,pallmall),X),
           %  write(X),nl,%6
          
     %   left(building(_,green,_,_,_),(_,white,_,_,_),X),
           member(building(A,_,green,_,_,_),X),
           member(building(B,_,white,_,_,_),X),
           left(A,B),
           %  write(X),nl,
           member(building(_,_,green,coffee,_,_),X),
           %   write(X),nl,%5
           member(building(3,_,_,milk,_,_),X),%7
           %    write(X),nl,
           member(building(_,_,yellow,_,_,dunhill),X), %8
           % write(X),nl,
           member(building(1,norwegian,_,_,_,_),X), %9
           %    write(X),nl,
           member(building(C,_,_,_,_,marlboro),X),
           member(building(D,_,_,_,cat,_),X),
           near(C,D),
           %   near([_,_,_,_,marlboro],[_,_,_,cat,_],X),%10
           % write(X),nl,
           member(building(E,_,_,_,horse,_),X),
           member(building(F,_,_,_,_,dunhill),X),
           near(E,F),
           % near([_,_,_,horse,_],[_,_,_,_,_,dunhill],X), %11
           %  write(X),nl,
          member(building(_,_,_,beer,_,winfield),X),  %12
          % write(X),nl,
          member(building(G,norwegian,_,_,_,_),X),
          member(building(H,_,blue,_,_,_),X),
          near(G,H),
          % near([norwegian,_,_,_,_],[_,blue,_,_,_],X), %13
          % write(X),nl,
          member(building(_,german,_,_,_,rothmans),X), %14
          % write(X),nl,
          member(building(I,_,_,_,_,marlboro),X),
          member(building(J,_,_,water,_,_),X),
          near(I,J),
          % near([_,_,_,_,marlboro],[_,_,water,_,_],X),%15
          %    write(X),nl,
          member(building(_,Y,_,_,fish,_),X).
          

