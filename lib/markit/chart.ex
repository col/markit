defmodule Markit.Chart do
  use HTTPoison.Base

  defstruct [:labels, :positions, :dates, :elements]

  def process_url(symbol) do
    params = %{
      "Normalized" => false,
      "NumberOfDays" => 3,
      "DataPeriod" => "Day",
      "Elements" => [
        %{
          "Symbol" => symbol,
          "Type" => "price",
          "Params" => ["c"]
        }
      ]
    } |> Poison.encode! |> URI.encode_www_form

    "http://dev.markitondemand.com/MODApis/Api/v2/InteractiveChart/json?parameters=#{params}"
  end

  def process_response_body(body) do
    params = body
    |> Poison.decode!
    |> underscore_n_atomize

    struct(%Markit.Chart{}, params)
    |> Map.update!(:elements, &process_elements/1)

  end

  def underscore_n_atomize(map) when is_map(map) do
    Enum.reduce(map, %{}, fn({key, value}, acc) ->
      key = Mix.Utils.underscore(key) |> String.to_atom
      value = underscore_n_atomize(value)
      Map.put(acc, key, value)
    end)
  end

  def underscore_n_atomize(list) when is_list(list) do
    Enum.map(list, &underscore_n_atomize/1)
  end

  def underscore_n_atomize(type) do
    type
  end

  def process_elements(elements) do
    Enum.map(elements, fn(e) ->
      struct(%Markit.ChartElement{}, e)
      |> Map.update!(:data_series, &process_data_series/1)
    end)
  end

  def process_data_series(data_series) do
    Enum.reduce(data_series, %{}, fn({k, v}, acc) ->
      Map.put(acc, k, struct(%Markit.DataSeries{}, v))
    end)
  end

end
