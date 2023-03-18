-module(talk).
-export([alice/0, bob/2, run/0]).

alice() ->
    receive
        {{message, Msg}, PId} ->
                io:fwrite("Alice got a message~n"),
                io:fwrite("Message: ~s~n", [Msg]),
                PId ! message,
                alice();
        finished -> io:fwrite("Alice is finished~n")
    end.

bob(0, PId) ->
    PId ! finished,
    io:fwrite("Bob is finished\n");
bob(N, PId) ->
    PId ! {{message, "The message"}, self()},
    receive
        message -> io:fwrite("Bob got a message~n")
    end,
    bob(N - 1, PId).

run() ->
    PId = spawn(talk, alice, []),
    spawn(talk, bob, [3, PId]).
