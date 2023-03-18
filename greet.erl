-module(greet).

-export([greet/1]).

greet([]) ->
    true;
greet([Name | Rest]) ->
    io:fwrite("Hello " ++ Name ++ "\n"),
    greet(Rest).
