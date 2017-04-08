lector(1, tkach, phd, stanford).
lector(2, vovk, phd, naukma).
lector(3, yuschenko, phd, naukma).
lector(4, gulaeva,  profe, naukma).
lector(5, glybovets, phd, knu).

subject(1, oka, 12).
subject(2, oop, 13).
subject(3, oop, 14).
subject(4, moop, 15).
subject(5, math, 16).

group(1, math).
group(2, pi).
group(3,  inf).

schedule(1, 5, 1, 1, 112).
schedule( 2, 2, 2, 2, 113).
schedule( 3, 3, 3, 8, 114).
%Z01
% How PhD are there in naukma ?
?- lector(_,Surname,phd, naukma).
%Z02
%How many hours does math take ?
?- subject(_,math,X).
%Z03
% in which groups do we have math classes ?
?- group(Id_of_group, math).
%Z04
% In which classroom there is a math lesson ?
?- subject(Y,math,_),
   schedule(_,Y,_,_,Classroom).
%Z05
   % subject on 8 lesson
?- schedule(_,Y,_,8,_),
  subject(Y,Subject,_).


