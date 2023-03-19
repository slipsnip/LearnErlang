-module(talk).
-export([alice/0, bob/1, run/0]).

alice() ->
    receive
        {message, Msg} ->
                io:fwrite("Alice got a message \"~s\"~n", [Msg]),
                alice();
        finished -> done
    end.

bob(0) ->
    alice ! finished;
bob(N) ->
    alice ! {message, "The message"},
    bob(N - 1).

run() ->
    register(alice, spawn(talk, alice, [])),
    register(bob, spawn(talk, bob, [3])).
