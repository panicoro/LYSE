-module(recursive).
-export([fact/1, len/1, reverse/1, tail_len/1,
         tail_fac/1, duplicate/2, tail_duplicate/2,
         tail_reverse/1]).

fact(0)  -> 1;
fact(N) when N > 0 -> N * fact(N-1).

len([]) -> 0;
len([_|T]) -> 1 + len([T]).


%% tail recursion factorial
tail_fac(N) -> tail_fac(N,1).
 
tail_fac(0,Acc) -> Acc;
tail_fac(N,Acc) when N > 0 -> tail_fac(N-1,N*Acc).


%% tail recursion length
tail_len(L) -> tail_len(L,0).
 
tail_len([], Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T,Acc+1).


%% duplicate function
duplicate(0,_) -> [];
duplicate(N, Term) when N > 0 ->
    [Term| duplicate(N-1, Term)].

    
%% duplicate function using tail recursion
tail_duplicate(N,Term) -> tail_duplicate(N,Term,[]).

tail_duplicate(0, _, List) -> List;
tail_duplicate(N, Term, List) when N > 0 -> 
    tail_duplicate(N-1, Term, [Term|List]).


reverse([]) -> [];
reverse([H|T]) -> reverse(T)++[H].
    

%% reverse function using tail recursion    
tail_reverse(L) -> tail_reverse(L,[]).
 
tail_reverse([],Acc) -> Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T, [H|Acc]).
    
        
sublist(_,0) -> [];
sublist([],_) -> [];
sublist([H|T],N) when N > 0 -> [H|sublist(T,N-1)].


%% sublist function using tail recursion
tail_sublist(L, N) -> tail_sublist(L, N, []).
 
tail_sublist(_, 0, SubList) -> SubList;
tail_sublist([], _, SubList) -> SubList;
tail_sublist([H|T], N, SubList) when N > 0 ->
                                tail_sublist(T, N-1, [H|SubList]).
        
    
