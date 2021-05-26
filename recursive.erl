-module(recursive).
-export([fact/1, len/1, reverse/1, tail_len/1,
         tail_fac/1, duplicate/2, tail_duplicate/2,
         tail_reverse/1, sublist/2, tail_sublist/2,
         zip/2, tail_zip/2, lenient_zip/2, tail_lenient_zip/2]).

%% factorial function
fact(0)  -> 1;
fact(N) when N > 0 -> N * fact(N-1).


%% length function
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


%% reverse function
reverse([]) -> [];
reverse([H|T]) -> reverse(T)++[H].
    

%% reverse function using tail recursion    
tail_reverse(L) -> tail_reverse(L,[]).
 
tail_reverse([],Acc) -> Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T, [H|Acc]).
    

%% sublist function
sublist(_,0) -> [];
sublist([],_) -> [];
sublist([H|T],N) when N > 0 -> [H|sublist(T,N-1)].


%% sublist function using tail recursion
tail_sublist(L, N) -> reverse(tail_sublist(L, N, [])).
 
tail_sublist(_, 0, SubList) -> SubList;
tail_sublist([], _, SubList) -> SubList;
tail_sublist([H|T], N, SubList) when N > 0 ->
                                tail_sublist(T, N-1, [H|SubList]).
                              

%% zip function
zip([],[]) -> [];
zip([X|Xs], [Y|Ys]) -> [{X,Y}|zip(Xs,Ys)].


%% zip function using tail recursion
tail_zip(List1, List2) -> reverse(tail_zip(List1, List2, [])).

tail_zip([],[], ListZipped) -> ListZipped;
tail_zip([X|Xs], [Y|Ys], ListZipped) -> tail_zip(Xs, Ys, [{X,Y}|ListZipped]).


%% A zip function that stops when one of the list have done
lenient_zip([], _) -> [];
lenient_zip(_, []) -> [];
lenient_zip([X|Xs], [Y|Ys]) -> [{X,Y}|lenient_zip(Xs,Ys)].


%% lenient_zip using tail recursion.
tail_lenient_zip(List1, List2) -> reverse(tail_lenient_zip(List1, List2, [])).

tail_lenient_zip([], _, ListZipped) -> ListZipped;
tail_lenient_zip(_, [], ListZipped) -> ListZipped;
tail_lenient_zip([X|Xs],[Y|Ys], ListZipped) -> tail_lenient_zip(Xs, Ys, [{X,Y}|ListZipped]).

