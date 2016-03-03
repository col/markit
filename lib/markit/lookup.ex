defmodule Markit.Lookup do
  use HTTPoison.Base

  def process_url(keyword) do
    "http://dev.markitondemand.com/MODApis/Api/v2/Lookup/json?input=#{keyword}"
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.reduce([], fn(company, acc) ->
          params = Enum.reduce(company, %{}, fn({k, v}, acc) ->
            Map.put(acc, Mix.Utils.underscore(k) |> String.to_atom, v)
          end)
          [struct(%Markit.Company{}, params) | acc]
       end)
  end
end
