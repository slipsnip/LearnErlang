-module(cardealer).

-export([listPrices/1]).

listPrices(Currency) ->
    Cars = ["BMW i8", "Laborghini Huracan", "Ferrari f12"],
    Prices = #{"BMW i8" => 150000,
              "Laborghini Huracan" => 500000,
               "Ferrari f12" => 700000},
    listPrices({Cars, Prices}, Currency).

listPrices({[], _Prices}, _Currency) ->
    true;
listPrices({[Car | Rest], Prices}, Currency) ->
    Price = maps:get(Car, Prices),
    case Currency of
        eur ->
            Rounded = round(Price * 0.94020),
            io:fwrite("Price ~w\n", [Rounded]),
            listPrices({Rest, Prices}, Currency);
        gbp ->
            Rounded = round(Price * 0.83),
            io:fwrite("Price ~w\n", [Rounded]),
            listPrices({Rest, Prices}, Currency);
        usd ->
            Rounded = round(Price * 0.00),
            io:fwrite("Price ~w\n", [Rounded])
    end.
