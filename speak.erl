-module(speak).
-export([run/0, say/2]).

say(_What, 0) ->
    done;
say(What, Times) ->
    io:fwrite("~s~n", [What]),
    say(What, Times - 1).

run() ->
    spawn(speak, say, ["Hi", 3]),
    spawn(speak, say, ["World", 3]).
