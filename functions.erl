-module(functions).
-compile(export_all).

greet(male, Name) ->
    io:format("Hello, Mr. ~s!", [Name]);
greet(female, Name) ->
    io:format("Hello, Mrs. ~s!", [Name]);
greet(_, Name) ->
    io:format("Hello, ~s!", [Name]).
    
head([H|_]) -> H.

second([_,X|_]) -> X.

same(X,X) -> 
    true;
same (_,_) -> 
    false.
    
valid_time({Date = {Y,M,D}, Time = {H,Min,S}}) ->
    io:format("The Date tuple (~p) says today is: ~p/~p/~p,~n",[Date,Y,M,D]),
    io:format("The Time tuple (~p) indicates: ~p:~p:~p.~n", [Time,H,Min,S]);
valid_time(_) ->
    io:format("Stop feeding me wrong data!~n").
    
old_enough(X)
    when X >= 16, X =< 104 -> 
    true;
old_enough(_) -> 
    false.
    
wrong_age(X) when X < 16; X < 104 ->
    true;
wrong_age(X) -> false.
