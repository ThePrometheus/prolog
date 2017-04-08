family(
    person( tom, fox, date(7,may,1950),works(bbc,15200) ),
    person( ann,fox, date(9, may, 1951), unemployed),
    [ person(pat, fox, date(5,may, 1973), unemployed),
        person( jim, fox, date(5,may,1973), works(radio,7000) ),
         person(carry,fox,date(10,june,1981), unemployed)] ).
% Helper functions

dateofbirth(person(_,_,Date,_),Date).
husband(X):-family(X,_,_).

wife(X):- family(_,X,_).

child(X):- family(_,_, Children),
           member(X,Children).

member(X, [X|L]).
member(X, [Y|L]) :- member(X,L).

exists(Person):- husband(Person);wife(Person);child(Person);

salary(person(_,_,_,works(_,S)),S).
salary(person(_,_,_,unemployed),0).

%Z01
% Find all born in 1981
?- child(X),dateofbirth(X,date(_,_,1981)).
%Z02
% Find all unemployed wifes
?- wife(person(Name,Surname,_,unemployed)).
%Z03 Find all people who don't work and aren't retired
?- exists(person(Name,Surname,date(_,_,Year),unemployed)),Year > 1952.
%Z04 Find all people who are born before 1961 and have a salary less then 10000
?- exists( Person),dateofbirth( Person, date( _) _, Year) ),Year < 1961,salary( Person, Salary),Salary < 10000.
%Z05 All surnames of those who have at least 3 children 
?- exists(person(_,Surname,_,_,)_,_,[_,_,_|_]).
%Z06 families without chiildren 
?- family(person(_,Name,_,_),_,[]).
%Z07 All employed children 
?- child(person(Name,Surname,_,works(_,_))).
%Z08 Family where a wife works and father does not
?- family(person(_,Name,_,unemployed),person(_,_,_, works(_,_)).
%Z09 All families where difference within parents age is greater or equal to 15
?- family(Husband, Wife,Children),
   dateofbirth(Husband,date(_,_,Y1)),
   dateofbirth(Wife,date(_,_,Y2)),
   (Y1-Y2>=15;Y2-Y1>=15;),member(Child,Children).

