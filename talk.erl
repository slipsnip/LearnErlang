-module(talk).
-export([alice/0, bob/2, run/0, startAlice/0, startBob/1]).

alice() ->
    receive
        {message, Msg, BobNode} ->
                io:fwrite("Alice got a message \"~s\"~n", [Msg]),
                BobNode ! message,
                alice();
        finished -> io:fwrite("Alice finished~n")
    end.

bob(0, AliceNode) ->
    {alice, AliceNode} ! finished,
    done;
bob(N, AliceNode) ->
    {alice, AliceNode} ! {message, "The message", self()},
    receive
        message -> io:fwrite("Bob got a reply~n")
    end,
    bob(N - 1, AliceNode).

run() ->
    register(alice, spawn(talk, alice, [])),
    register(bob, spawn(talk, bob, [3])).

startAlice() ->
    register(alice, spawn(talk, alice, [])).

startBob(AliceNode) ->
    spawn(talk, bob, [3, AliceNode]).
