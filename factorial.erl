-module(factorial).

-export([factorial/1]).

%% writen like a text book

factorial(1) ->
    1;
factorial(N) ->
    N * factorial(N - 1).
