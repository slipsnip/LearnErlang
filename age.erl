-module(age).

-export([getAge/1]).

getAge(Name) ->
    AgeMap = #{"Michael" => 40, "Bob" => 25, "Katherine" => 56},
    maps:get(Name, AgeMap, -1).
