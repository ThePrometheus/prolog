book(0000,edwards,functional_analysis,mir,1951,1200).
book(0001, gmurman, teoriya_veroyatnostei, fizmatlit, 2002,321).
book(0010, burbaki, algebra, fizmatlit,1962,432).
book(0110, moklyanchuk, decision_theory,mir, 2005,508).
book(1000, bratko, prolog,springer, 1981, 444).

reader(nazar_tkach,perova,707, 19,unemployed).
reader(alex_frankiv, trya, 13, 19, unemployed).
reader(vadim_tomashuk, troy, 103, 19, unemployed).
reader(gulaeva,none, none,unknown, demon).
reader( glybovets, unknown,unknown,unknown, teacher).

idcard(nazar_tkach,0000,date(10,feb,2017),date(11,feb,2017),yes).
idcard(alex_frankiv,0001,date(12,feb,2017),date(15,feb,2017),no).
idcard(vadim_tomaschuk, 0010, date(16,feb,2017),date(17,feb,2017),yes).
idcard(gulaeva,0110, date(18,feb,2017),date(19,feb,2017),no).
idcard(glybovets,1000, date(20,feb,2017), date(21,feb,2017),yes).

% Who has taken that book ?
z01(B,Y):- book(X,_,B,_,_,_), idcard(Y,X,_,_,_).

%Who has not returned a book yet ?
z02(Y):- idcard(Y,_,_,_,no).
% Which books are read by people from 18 to 25 ?
z03(Y):- reader(X,_,_,Age,_),Age>18,Age < 25,idcard(X,I,_,_,_),book(I,_,Y,_,_,_).
% Which authors are beloved by our reader ?
z04(R,Y):- idcard(R,X,_,_,_),book(X,Y,_,_,_,_).
%Which books are read by that reader ?
z05(R,Y):- idcard(R,X,_,_,_),book(X,_,Y,_,_,_).

%TASK 2

id(reader(nazar_tkach,perova,707,19,unemployed),book(0000,edwards,functional_analysis,mir,1951,1200),date(10,feb,2017),date(11,feb,2017),yes).
id(reader(alex_frankiv,troya, 13,19, unemployed),book(0001,gmurman,teoriya_veroyatnostei, fizmatlit, 2002,321),date(15,feb,2017),date(15,feb,2017),no).
id(reader(vadim_tomashuck,troy,103,19,unemployed),book(0010, burbaki, algebra,fizmatlit,1962,432),date(16,feb,2017),date(17,feb,2017),no).
id(reader(gulaeva,none,none,unknown,demon),book(0110, moklyanchuk,decision_theory, mir,2005,508),date(18,feb,2017),date(19,feb,2017),yes).
id(reader(glybovets,unknown,unknown, teacher),book(1000, bratko, prolog, springer, 1981,444),date(20,feb,2017),date(21,feb,2017),yes).

z06(B,Y):- id(reader(Y,_,_,_,_),book(_,_,B,_,_,_),_,_,_).

z07(Y):- id(reader(Y,_,_,_,_),_,_,_,no).

z08(Y):- id(reader(N,_,_,Age,_),_,_,_,_),Age >18,Age<25,id(reader(N,_,_,_,_),book(_,_,Y,_,_,_),_,_,_).
z09(R,Y):- id(reader(R,_,_,_,_),book(_,Y,_,_,_,_),_,_,_).
z10(R,Y):- id(reader(R,_,_,_,_),book(_,_,Y,_,_,_),_,_,_).



