defmodule Markit.LookupTest do
  use ExUnit.Case
  doctest Markit.Lookup

  test "parses a valid response" do
    {:ok, body} = File.read("test/data/lookup_response.json")

    result = Markit.Lookup.process_response_body(body)

    assert result == [%Markit.Company{
        name: "Netflix Inc",
        symbol: "NFLX",
        exchange: "NASDAQ"
    }]
  end

end
