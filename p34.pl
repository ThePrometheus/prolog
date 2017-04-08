:- ensure_loaded(p33).
:- arithmetic_function(totient_phi/1).

totient_phi(1,1):- !.
totient_phi(M,Phi):- t_phi(M,Phi,1,0).

t_phi(M,Phi,M,Phi):- !.
t_phi(M,Phi,,K,C):- K < M ,
                   C1 is C + 1,
                   K1 is K + 1,
                   t_phi(M,Phi,K1,C1).
t_phi(M,Phi,K,C):- K < M, K1 is K+1,
                   t_phi(M,Phi,K1,C).

