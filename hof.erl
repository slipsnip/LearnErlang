-module(hof).

-export([double/0]).

double() ->
    F = fun(X) ->
                2 * X end,
    map(F, [1, 2, 9, 3, 6]).

map(_F, []) ->
    [];
map(F, [First | Rest]) ->
    [F(First) | map(F, Rest)].
