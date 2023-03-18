-module(talk).
-export([alice/0, bob/2, run/0]).

alice() ->
    receive
        {message, Msg} ->
                io:fwrite("Alice got a message \"~s\"~n", [Msg]),
                alice();
        finished -> done
    end.

bob(0, PId) ->
    PId ! finished;
bob(N, PId) ->
    PId ! {message, "The message"},
    bob(N - 1, PId).

run() ->
    PId = spawn(talk, alice, []),
    spawn(talk, bob, [3, PId]).
