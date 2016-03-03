defmodule Markit.Quote do
  use HTTPoison.Base

  defstruct [:name, :symbol, :last_price, :change, :change_percent, :timestamp,
  :ms_date, :market_cap, :volume, :change_ytd, :change_percent_ytd, :high, :low,
  :open]

  def process_url(symbol) do
    "http://dev.markitondemand.com/MODApis/Api/v2/Quote/json?symbol=#{symbol}"
  end

  def process_response_body(body) do
    params = body
    |> Poison.decode!
    |> Enum.reduce(%{}, fn({k, v}, acc) ->
         Map.put(acc, Mix.Utils.underscore(k) |> String.to_atom, v)
       end)

    struct(%Markit.Quote{}, params)
  end
end
