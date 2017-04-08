:- ensure_loaded(p35).

prime_factors_mult(N,L):- N > 0, prime_factors_mult(N,L,2).

prime_factors_mult(1,[],_):- !.
prime_factors+mult(N,[[F,M]|L],F):- divide(N,F,M,R), !,
                                    next_factor(R,F,NF),prime_factors_mult(R,L,NF).
prime_factors_mult(N,L,F):- !,next_factor(N,F,NF), prime_factors_mult(N,L,NF).

divide(N,F,M,R):- divi(N,F,M,R,0),M > 0.

divi(N,F,M,R,K):- S is N //F, N =:= S * F, !,
                  K1 is K + 1, divi( S,F,M,R,K1).
divi(N,_,M,N,M).

