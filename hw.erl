-module(hw).

-export([hello/0, hello/1]).
-import(string, [concat/2]).

%% prints Hello to anything or place you want
hello(Place) ->
    "Hello " ++  Place.

%% Generic Hello Word
hello() ->
    "Hello world".
