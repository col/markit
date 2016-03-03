defmodule Markit.QuoteTest do
  use ExUnit.Case
  doctest Markit

  test "parses a valid response" do
    {:ok, body} = File.read("test/data/quote_response.json")

    result = Markit.Quote.process_response_body(body)

    assert result == %Markit.Quote{
        name: "Apple Inc",
        symbol: "AAPL",
        last_price: 101.26,
        change: 0.510000000000005,
        change_percent: 0.506203473945415,
        timestamp: "Thu Mar 3 09:45:17 UTC-05:00 2016",
        ms_date: 42432.4064467603,
        market_cap: 561444474580,
        volume: 214527,
        change_ytd: 105.26,
        change_percent_ytd: -3.8001140034201,
        high: 101.36,
        low: 100.45,
        open: 100.55
    }
  end

end
